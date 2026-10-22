#include "controller.h"

static void __osPackReadData(void);

s32 osContStartReadData(OSMesgQueue* queue) {
    s32 result = 0;
    int i;

    __osSiGetAccess();
    if (D_8007E608 != CONT_CMD_READ_BUTTON) {
        __osPackReadData();
        result = __osSiRawStartDma(1, &D_8007E5C8);
        osRecvMesg(queue, 0, 1);
    }
    for (i = 0; i < 16; i++) {
        ((u32*)&D_8007E5C8)[i] = CONT_CMD_NOP;
    }
    D_8007E5C8.pifstatus = 0;
    result = __osSiRawStartDma(0, &D_8007E5C8);
    D_8007E608 = CONT_CMD_READ_BUTTON;
    __osSiRelAccess();
    return result;
}

void osContGetReadData(OSContPad* data) {
    u8* ptr;
    OSContReadFormat format;
    int i;

    ptr = (u8*)&D_8007E5C8;
    for (i = 0; i < D_8007E609; i++, ptr += sizeof(format), data++) {
        format = *(OSContReadFormat*)ptr;
        data->errno = CHNL_ERR(format);
        if (data->errno == 0) {
            data->button = format.button;
            data->stick_x = format.stick_x;
            data->stick_y = format.stick_y;
        }
    }
}

static void __osPackReadData(void) {
    u8* ptr;
    OSContReadFormat format;
    int i;

    ptr = (u8*)&D_8007E5C8;
    for (i = 0; i < 16; i++) {
        ((u32*)&D_8007E5C8)[i] = 0;
    }
    D_8007E5C8.pifstatus = CONT_CMD_EXE;
    format.dummy = CONT_CMD_NOP;
    format.txsize = CONT_CMD_READ_BUTTON_TX;
    format.rxsize = CONT_CMD_READ_BUTTON_RX;
    format.cmd = CONT_CMD_READ_BUTTON;
    format.button = 0xFFFF;
    format.stick_x = -1;
    format.stick_y = -1;
    for (i = 0; i < D_8007E609; i++) {
        *(OSContReadFormat*)ptr = format;
        ptr += sizeof(format);
    }
    *ptr = CONT_CMD_END;
}
