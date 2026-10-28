#include "types.h"

#ifndef NULL
#define NULL 0
#endif

s32 func_800E1A84(void *, u8 *);                /* extern */
s32 func_800E1BAC(void *, u8 *);                /* extern */
extern void *D_800855F8;

void func_800C5A8C(void) {
    u8 sp10;
    void *var_s0;

    var_s0 = D_800855F8;
    sp10 = 0xD;
    if (var_s0 != NULL) {
        do {
            if (((*(u16 *)((u8 *)(var_s0) + 0x28)) & 0x10) || ((*(s32 *)((u8 *)((*(void **)((u8 *)(var_s0) + 0x24))) + 0x14)) & 0x10000)) {
                if ((*(u8 *)((u8 *)(var_s0) + 0x68)) != sp10) {
                    func_800E1BAC(var_s0, &sp10);
                }
            } else {
                func_800E1A84(var_s0, &sp10);
            }
            var_s0 = (*(void **)((u8 *)(var_s0) + 0));
        } while (var_s0 != NULL);
    }
}
