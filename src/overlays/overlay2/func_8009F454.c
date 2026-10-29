#include "types.h"

#ifndef NULL
#define NULL 0
#endif

s32 func_8009F60C();                            /* extern */
s32 func_800D5C1C(s32, void *, s32 *);  /* extern */
extern s32 *D_800725B8;
extern s32 D_800725DC;
extern s32 D_8009DF90;
extern s32 D_8009DFB8;
extern s8 D_800C4EEB;

void func_8009F454(void *arg0) {
    void *handler;

    func_8009F60C();
    (*(s32 *)((u8 *)(arg0) + 0x18)) = 0x568;
    (*(s32 *)((u8 *)(arg0) + 0x1C)) = 0;
    (*(s32 *)((u8 *)(arg0) + 0x20)) = 0xFA;
    switch (D_800C4EEB) {
        case 8:
            handler = &D_8009DF90;
            break;
        case 16:
            handler = &D_8009DFB8;
            break;
        default:
            goto done;
    }
    D_800725B8 = handler;
done:
    func_800D5C1C(0x560, arg0, &D_800725DC);
}
