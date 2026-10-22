#include "controller.h"

static void __osPackRamWriteData(int channel, u16 address, u8* buffer);
extern s32 __osPfsGetStatus(OSMesgQueue* queue, s32 channel);

s32 __osContRamWrite(OSMesgQueue* queue, int channel, u16 address,
                     u8* buffer, int force) {
    s32 result = 0;
    int index;
    u8* ptr;
    OSContRamReadFormat format;
    int retries;

    ptr = (u8*)&D_8007BFC8;
    retries = 2;
    if (force != 1 && address < 7 && address != 0) {
        return 0;
    }
    __osSiGetAccess();
    D_8007E608 = 3;
    __osPackRamWriteData(channel, address, buffer);
    result = __osSiRawStartDma(1, &D_8007BFC8);
    osRecvMesg(queue, 0, 1);
    do {
        for (index = 0; index < 16; index++) {
            D_8007BFC8.ramarray[index] = 0xFF;
        }
        D_8007BFC8.pifstatus = 0;
        result = __osSiRawStartDma(0, &D_8007BFC8);
        osRecvMesg(queue, 0, 1);
        ptr = (u8*)&D_8007BFC8;
        if (channel != 0) {
            for (index = 0; index < channel; index++) {
                ptr++;
            }
        }
        format = *(OSContRamReadFormat*)ptr;
        result = CHNL_ERR(format);
        if (result == 0) {
            if (__osContDataCrc(buffer) != format.datacrc) {
                result = __osPfsGetStatus(queue, channel);
                if (result != 0) {
                    __osSiRelAccess();
                    return result;
                }
                result = 4;
            }
        }
    } while (result == 4 && retries-- >= 0);
    __osSiRelAccess();
    return result;
}

static void __osPackRamWriteData(int channel, u16 address, u8* buffer) {
    u8* ptr;
    OSContRamReadFormat format;
    int index;

    ptr = (u8*)&D_8007BFC8;
    for (index = 0; index < 16; index++) {
        ((u32*)&D_8007BFC8)[index] = 0;
    }
    D_8007BFC8.pifstatus = CONT_CMD_EXE;
    format.dummy = CONT_CMD_NOP;
    format.txsize = 35;
    format.rxsize = 1;
    format.cmd = 3;
    format.address = (address << 5) | __osContAddressCrc(address);
    format.datacrc = CONT_CMD_NOP;
    for (index = 0; index < 32; index++) {
        format.data[index] = *buffer++;
    }
    if (channel != 0) {
        for (index = 0; index < channel; index++) {
            *ptr++ = 0;
        }
    }
    *(OSContRamReadFormat*)ptr = format;
    ptr += sizeof(OSContRamReadFormat);
    ptr[0] = CONT_CMD_END;
}
