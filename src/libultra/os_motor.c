#include "controller.h"
#include "pfs.h"

static OSPifRam motorStopData[4];
static OSPifRam motorStartData[4];
static u8 motorStopBuffer[32];
static u8 motorStartBuffer[32];

static void makeMotorData(int channel, u16 address, u8* buffer,
                          OSPifRam* data);

s32 osMotorStop(OSPfs* pfs) {
    int i;
    s32 result;
    u8* pointer;
    OSContRamReadFormat format;

    pointer = (u8*)&D_8007BFC8;
    __osSiGetAccess();
    D_8007E608 = 3;
    __osSiRawStartDma(1, &motorStopData[pfs->channel]);
    osRecvMesg(pfs->queue, 0, 1);
    result = __osSiRawStartDma(0, &D_8007BFC8);
    osRecvMesg(pfs->queue, 0, 1);
    pointer = (u8*)&D_8007BFC8;
    if (pfs->channel != 0) {
        for (i = 0; i < pfs->channel; i++) {
            pointer++;
        }
    }
    format = *(OSContRamReadFormat*)pointer;
    result = CHNL_ERR(format);
    if (result == 0 && format.datacrc != 0) {
        result = 4;
    }
    __osSiRelAccess();
    return result;
}

s32 osMotorStart(OSPfs* pfs) {
    int i;
    s32 result;
    u8* pointer;
    OSContRamReadFormat format;

    pointer = (u8*)&D_8007BFC8;
    __osSiGetAccess();
    D_8007E608 = 3;
    __osSiRawStartDma(1, &motorStartData[pfs->channel]);
    osRecvMesg(pfs->queue, 0, 1);
    result = __osSiRawStartDma(0, &D_8007BFC8);
    osRecvMesg(pfs->queue, 0, 1);
    pointer = (u8*)&D_8007BFC8;
    if (pfs->channel != 0) {
        for (i = 0; i < pfs->channel; i++) {
            pointer++;
        }
    }
    format = *(OSContRamReadFormat*)pointer;
    result = CHNL_ERR(format);
    if (result == 0 && format.datacrc != 0xEB) {
        result = 4;
    }
    __osSiRelAccess();
    return result;
}

static void makeMotorData(int channel, u16 address, u8* buffer,
                          OSPifRam* data) {
    u8* pointer;
    OSContRamReadFormat format;
    int i;

    pointer = (u8*)data->ramarray;
    for (i = 0; i < 15; i++) {
        data->ramarray[i] = 0;
    }
    data->pifstatus = CONT_CMD_EXE;
    format.dummy = CONT_CMD_NOP;
    format.txsize = 35;
    format.rxsize = 1;
    format.cmd = 3;
    format.address = (address << 5) | __osContAddressCrc(address);
    format.datacrc = CONT_CMD_NOP;
    for (i = 0; i < 32; i++) {
        format.data[i] = *buffer++;
    }
    if (channel != 0) {
        for (i = 0; i < channel; i++) {
            *pointer++ = 0;
        }
    }
    *(OSContRamReadFormat*)pointer = format;
    pointer += sizeof(OSContRamReadFormat);
    pointer[0] = CONT_CMD_END;
}

s32 osMotorInit(OSMesgQueue* queue, OSPfs* pfs, int channel) {
    int i;
    s32 result;
    u8 temporary[32];

    pfs->queue = queue;
    pfs->channel = channel;
    pfs->status = 0;
    pfs->activebank = 0x80;
    for (i = 0; i < 32; i++) {
        temporary[i] = 0x80;
    }
    result = __osContRamWrite(queue, channel, 0x400, temporary, 0);
    if (result == 2) {
        result = __osContRamWrite(queue, channel, 0x400, temporary, 0);
    }
    if (result != 0) {
        return result;
    }
    result = __osContRamRead(queue, channel, 0x400, temporary);
    if (result == 2) {
        result = 4;
    }
    if (result != 0) {
        return result;
    }
    if (temporary[31] != 0x80) {
        return 11;
    }
    for (i = 0; i < 32; i++) {
        motorStartBuffer[i] = 1;
        motorStopBuffer[i] = 0;
    }
    makeMotorData(channel, 0x600, motorStartBuffer, &motorStartData[channel]);
    makeMotorData(channel, 0x600, motorStopBuffer, &motorStopData[channel]);
    return 0;
}
