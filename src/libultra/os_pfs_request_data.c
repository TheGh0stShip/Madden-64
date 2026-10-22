#include "controller.h"

void __osPfsRequestData(u8 command) {
    u8* ptr;
    OSContRequestFormat format;
    int index;

    D_8007E608 = command;
    for (index = 0; index < 16; index++) {
        ((u32*)&D_8007BFC8)[index] = 0;
    }
    D_8007BFC8.pifstatus = CONT_CMD_EXE;
    ptr = (u8*)&D_8007BFC8;
    format.dummy = CONT_CMD_NOP;
    format.txsize = CONT_CMD_REQUEST_STATUS_TX;
    format.rxsize = CONT_CMD_REQUEST_STATUS_RX;
    format.cmd = command;
    format.typeh = CONT_CMD_NOP;
    format.typel = CONT_CMD_NOP;
    format.status = CONT_CMD_NOP;
    format.dummy1 = CONT_CMD_NOP;
    for (index = 0; index < D_8007E609; index++) {
        *(OSContRequestFormat*)ptr = format;
        ptr += sizeof(format);
    }
    *ptr = CONT_CMD_END;
}
