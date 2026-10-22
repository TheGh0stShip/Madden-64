#include "os_internal.h"

#define PI_STATUS_REG 0xA4600010
#define PI_STATUS_DMA_BUSY 1
#define PI_STATUS_IO_BUSY 2
#define PI_STATUS_CLR_INTR 2
#define SR_IBIT4 0x00000800
#define OS_IM_PI 0x00100401

#define LEO_STATUS 0xA5000508
#define LEO_BM_STATUS 0xA5000510
#define LEO_BM_CTL 0xA5000510
#define LEO_C2_BUFF 0x05000000
#define LEO_SECTOR_BUFF 0x05000400
#define LEO_STATUS_DATA_REQUEST 0x40000000
#define LEO_STATUS_C2_TRANSFER 0x10000000
#define LEO_STATUS_BUFFER_MANAGER_ERROR 0x08000000
#define LEO_STATUS_MECHANIC_INTERRUPT 0x02000000
#define LEO_BM_STATUS_MICRO 0x02000000
#define LEO_BM_STATUS_C1DOUBLE 0x00400000
#define LEO_BM_STATUS_C1SINGLE 0x00200000
#define LEO_BM_CTL_RESET 0x10000000
#define LEO_BM_CTL_CLR_MECHANIC_INTR 0x01000000

#define LEO_CMD_TYPE_0 0
#define LEO_CMD_TYPE_1 1
#define LEO_CMD_TYPE_2 2
#define LEO_ERROR_GOOD 0
#define LEO_ERROR_4 4
#define LEO_ERROR_22 22
#define LEO_ERROR_23 23
#define LEO_ERROR_24 24
#define LEO_ERROR_29 29
#define LEO_TRACK_MODE 2
#define LEO_SECTOR_MODE 3
#define OS_READ 0
#define OS_WRITE 1

#define IO_READ(address) (*(volatile u32*)(address))
#define IO_WRITE(address, value) (*(volatile u32*)(address) = (value))
#define WAIT_ON_IOBUSY(value) \
    do { \
        value = IO_READ(PI_STATUS_REG); \
        while (value & (PI_STATUS_IO_BUSY | PI_STATUS_DMA_BUSY)) { \
            value = IO_READ(PI_STATUS_REG); \
        } \
    } while (0)

typedef struct OSEventState {
    OSMesgQueue* queue;
    OSMesg message;
} OSEventState;

extern OSPiHandle* __osDiskHandle;
extern u32 D_80074DC0;
extern OSEventState D_8007D288[];

static void __osLeoAbnormalResume(void);
static void __osLeoResume(void);

s32 __osLeoInterrupt(void) {
    u32 stat = 0;
    volatile u32 pi_stat;
    u32 bm_stat;
    OSTranxInfo* info = &__osDiskHandle->transferInfo;
    OSBlockInfo* blockInfo = &info->block[info->blockNum];

    pi_stat = IO_READ(PI_STATUS_REG);
    if (pi_stat & PI_STATUS_DMA_BUSY) {
        D_80074DC0 &= ~SR_IBIT4;
        blockInfo->errStatus = LEO_ERROR_29;
        __osLeoResume();
        return 1;
    }

    WAIT_ON_IOBUSY(pi_stat);
    stat = IO_READ(LEO_STATUS);
    if (stat & LEO_STATUS_MECHANIC_INTERRUPT) {
        WAIT_ON_IOBUSY(pi_stat);
        IO_WRITE(LEO_BM_CTL, info->bmCtlShadow | LEO_BM_CTL_CLR_MECHANIC_INTR);
        blockInfo->errStatus = LEO_ERROR_GOOD;
        return 0;
    }

    if (info->cmdType == LEO_CMD_TYPE_2) {
        return 1;
    }

    if (stat & LEO_STATUS_BUFFER_MANAGER_ERROR) {
        WAIT_ON_IOBUSY(pi_stat);
        stat = IO_READ(LEO_STATUS);
        blockInfo->errStatus = LEO_ERROR_22;
        __osLeoResume();
        IO_WRITE(PI_STATUS_REG, PI_STATUS_CLR_INTR);
        D_80074DC0 |= OS_IM_PI;
        return 1;
    }

    if (info->cmdType == LEO_CMD_TYPE_1) {
        if (!(stat & LEO_STATUS_DATA_REQUEST)) {
            if (info->sectorNum + 1 != info->transferMode * 85) {
                blockInfo->errStatus = LEO_ERROR_24;
                __osLeoAbnormalResume();
                return 1;
            }
            IO_WRITE(PI_STATUS_REG, PI_STATUS_CLR_INTR);
            D_80074DC0 |= OS_IM_PI;
            blockInfo->errStatus = LEO_ERROR_GOOD;
            __osLeoResume();
            return 1;
        }
        blockInfo->dramAddr = (void*)((u32)blockInfo->dramAddr + blockInfo->sectorSize);
        info->sectorNum++;
        __osEPiRawStartDma(__osDiskHandle, OS_WRITE, LEO_SECTOR_BUFF,
                           blockInfo->dramAddr, blockInfo->sectorSize);
        return 1;
    } else if (info->cmdType == LEO_CMD_TYPE_0) {
        if (info->transferMode == LEO_SECTOR_MODE) {
            if (info->sectorNum > (s32)blockInfo->c1ErrNum + 17) {
                blockInfo->errStatus = LEO_ERROR_GOOD;
                __osLeoAbnormalResume();
                return 1;
            }
            if (!(stat & LEO_STATUS_DATA_REQUEST)) {
                blockInfo->errStatus = LEO_ERROR_23;
                __osLeoAbnormalResume();
                return 1;
            }
        } else {
            blockInfo->dramAddr = (void*)((u32)blockInfo->dramAddr + blockInfo->sectorSize);
        }

        bm_stat = IO_READ(LEO_BM_STATUS);
        if (((bm_stat & LEO_BM_STATUS_C1SINGLE) &&
             (bm_stat & LEO_BM_STATUS_C1DOUBLE)) || (bm_stat & LEO_BM_STATUS_MICRO)) {
            if (blockInfo->c1ErrNum > 3) {
                if (info->transferMode != LEO_SECTOR_MODE || info->sectorNum > 0x52) {
                    blockInfo->errStatus = LEO_ERROR_23;
                    __osLeoAbnormalResume();
                    return 1;
                }
            } else {
                s32 errNum = blockInfo->c1ErrNum;
                blockInfo->c1ErrSector[errNum] = info->sectorNum + 1;
            }
            blockInfo->c1ErrNum++;
        }

        if (stat & LEO_STATUS_C2_TRANSFER) {
            if (info->sectorNum + 1 != 88) {
                blockInfo->errStatus = LEO_ERROR_24;
                __osLeoAbnormalResume();
            }
            if (info->transferMode == LEO_TRACK_MODE && info->blockNum == 0) {
                info->blockNum = 1;
                info->sectorNum = -1;
                info->block[1].dramAddr =
                    (void*)((u32)info->block[1].dramAddr - info->block[1].sectorSize);
                blockInfo->errStatus = LEO_ERROR_22;
            } else {
                IO_WRITE(PI_STATUS_REG, PI_STATUS_CLR_INTR);
                D_80074DC0 |= OS_IM_PI;
                info->cmdType = LEO_CMD_TYPE_2;
                blockInfo->errStatus = LEO_ERROR_GOOD;
            }
            __osEPiRawStartDma(__osDiskHandle, OS_READ, LEO_C2_BUFF,
                               (void*)blockInfo->c2Addr, blockInfo->sectorSize * 4);
            return 1;
        }

        if (info->sectorNum == -1 && info->transferMode == LEO_TRACK_MODE &&
            info->blockNum == 1) {
            OSBlockInfo* bptr = &info->block[0];
            if (bptr->c1ErrNum == 0) {
                if (((u32*)bptr->c2Addr)[0] | ((u32*)bptr->c2Addr)[1] |
                    ((u32*)bptr->c2Addr)[2] | ((u32*)bptr->c2Addr)[3]) {
                    bptr->errStatus = LEO_ERROR_24;
                    __osLeoAbnormalResume();
                    return 1;
                }
            }
            bptr->errStatus = 0;
            __osLeoResume();
        }
        info->sectorNum++;
        if (stat & LEO_STATUS_DATA_REQUEST) {
            if (info->sectorNum > 0x54) {
                blockInfo->errStatus = LEO_ERROR_24;
                __osLeoAbnormalResume();
                return 1;
            }
            __osEPiRawStartDma(__osDiskHandle, OS_READ, LEO_SECTOR_BUFF,
                               blockInfo->dramAddr, blockInfo->sectorSize);
            blockInfo->errStatus = LEO_ERROR_GOOD;
            return 1;
        } else if (info->sectorNum <= 0x54) {
            blockInfo->errStatus = LEO_ERROR_24;
            __osLeoAbnormalResume();
            return 1;
        }
        return 1;
    }

    blockInfo->errStatus = LEO_ERROR_4;
    __osLeoAbnormalResume();
    return 1;
}

static void __osLeoAbnormalResume(void) {
    OSTranxInfo* info = &__osDiskHandle->transferInfo;
    u32 pi_stat;

    WAIT_ON_IOBUSY(pi_stat);
    IO_WRITE(LEO_BM_CTL, info->bmCtlShadow | LEO_BM_CTL_RESET);
    WAIT_ON_IOBUSY(pi_stat);
    IO_WRITE(LEO_BM_CTL, info->bmCtlShadow);
    __osLeoResume();
    IO_WRITE(PI_STATUS_REG, PI_STATUS_CLR_INTR);
    D_80074DC0 |= OS_IM_PI;
}

static void __osLeoResume(void) {
    OSEventState* state = &D_8007D288[8];
    OSMesgQueue* queue = state->queue;
    s32 last;

    if (queue == 0 || queue->validCount >= queue->msgCount) {
        return;
    }
    last = (queue->first + queue->validCount) % queue->msgCount;
    queue->messages[last] = state->message;
    queue->validCount++;
    if (queue->mtqueue->next != 0) {
        __osEnqueueThread(&D_80074E28, __osPopThread(&queue->mtqueue));
    }
}
