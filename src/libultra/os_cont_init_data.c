#include "controller.h"

void __osContGetInitData(u8* pattern, OSContStatus* data) {
    u8* ptr;
    OSContRequestFormat format;
    int i;
    u8 bits = 0;

    ptr = (u8*)&D_8007E5C8;
    for (i = 0; i < D_8007E609; i++, ptr += sizeof(format), data++) {
        format = *(OSContRequestFormat*)ptr;
        data->errno = CHNL_ERR(format);
        if (data->errno == 0) {
            data->type = (format.typel << 8) | format.typeh;
            data->status = format.status;
            bits |= 1 << i;
        }
    }
    *pattern = bits;
}

void __osPackRequestData(u8 command) {
    u8* ptr;
    OSContRequestFormat format;
    int i;

    for (i = 0; i < 16; i++) {
        ((u32*)&D_8007E5C8)[i] = 0;
    }
    D_8007E5C8.pifstatus = CONT_CMD_EXE;
    ptr = (u8*)&D_8007E5C8;
    format.dummy = CONT_CMD_NOP;
    format.txsize = CONT_CMD_REQUEST_STATUS_TX;
    format.rxsize = CONT_CMD_REQUEST_STATUS_RX;
    format.cmd = command;
    format.typeh = CONT_CMD_NOP;
    format.typel = CONT_CMD_NOP;
    format.status = CONT_CMD_NOP;
    format.dummy1 = CONT_CMD_NOP;
    for (i = 0; i < D_8007E609; i++) {
        *(OSContRequestFormat*)ptr = format;
        ptr += sizeof(format);
    }
    *ptr = CONT_CMD_END;
}
