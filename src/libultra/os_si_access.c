#include "os_internal.h"

void __osSiCreateAccessQueue(void) {
    D_80074E10 = 1;
    osCreateMesgQueue(&D_8007D310, D_8007D308, 1);
    osSendMesg(&D_8007D310, 0, 0);
}

void __osSiGetAccess(void) {
    OSMesg message;

    if (!D_80074E10) {
        __osSiCreateAccessQueue();
    }
    osRecvMesg(&D_8007D310, &message, 1);
}

void __osSiRelAccess(void) {
    osSendMesg(&D_8007D310, 0, 0);
}
