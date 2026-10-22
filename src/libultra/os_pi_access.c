#include "os_internal.h"

void __osPiCreateAccessQueue(void) {
    D_80074E00 = 1;
    osCreateMesgQueue(&D_8007D260, D_8007D258, 1);
    osSendMesg(&D_8007D260, 0, 0);
}

void __osPiGetAccess(void) {
    OSMesg message;

    if (!D_80074E00) {
        __osPiCreateAccessQueue();
    }
    osRecvMesg(&D_8007D260, &message, 1);
}

void __osPiRelAccess(void) {
    osSendMesg(&D_8007D260, 0, 0);
}
