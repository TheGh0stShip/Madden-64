#include "controller.h"

static void __osPackRamReadData(int channel, u16 address);
extern s32 __osPfsGetStatus(OSMesgQueue* queue, s32 channel);

s32 __osContRamRead(OSMesgQueue* queue, int channel, u16 address,
                    u8* buffer) {
    s32 result;
    int index;
    u8* ptr;
    OSContRamReadFormat format;
    int retries;

    result = 0;
    ptr = (u8*)&D_8007BFC8;
    retries = 2;
    __osSiGetAccess();
    D_8007E608 = 2;
    __osPackRamReadData(channel, address);
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
            u8 crc;

            crc = __osContDataCrc(format.data);
            if (crc != format.datacrc) {
                result = __osPfsGetStatus(queue, channel);
                if (result != 0) {
                    __osSiRelAccess();
                    return result;
                }
                result = 4;
            } else {
                for (index = 0; index < 32; index++) {
                    *buffer++ = format.data[index];
                }
            }
        }
    } while (result == 4 && retries-- >= 0);
    __osSiRelAccess();
    return result;
}

static void __osPackRamReadData(int channel, u16 address) {
    u8* ptr;
    OSContRamReadFormat format;
    int index;

    ptr = (u8*)&D_8007BFC8;
    for (index = 0; index < 16; index++) {
        ((u32*)&D_8007BFC8)[index] = 0;
    }
    D_8007BFC8.pifstatus = CONT_CMD_EXE;
    format.dummy = CONT_CMD_NOP;
    format.txsize = 3;
    format.rxsize = 33;
    format.cmd = 2;
    format.address = (address << 5) | __osContAddressCrc(address);
    format.datacrc = CONT_CMD_NOP;
    for (index = 0; index < 32; index++) {
        format.data[index] = CONT_CMD_NOP;
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
