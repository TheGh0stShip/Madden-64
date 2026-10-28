#include "types.h"

#ifndef NULL
#define NULL 0
#endif

s32 func_800332C8(s32, s32);                    /* extern */
extern s32 D_800726D0;
extern void *D_80087940;

void func_800BDD68(void *arg0) {
    s32 temp_a0;
    void *temp_a0_2;
    void *temp_a1;

    temp_a0 = (*(s32 *)((u8 *)(arg0) + 0x14));
    if (temp_a0 & 0x100) {
        temp_a1 = (*(void **)((u8 *)(arg0) + 0x4C));
        (*(s32 *)((u8 *)(arg0) + 0x14)) = (s32) (temp_a0 & ~0x100);
        if (temp_a1 != NULL) {
            (*(void **)((u8 *)(temp_a1) + 0x50)) = (void *) (*(void **)((u8 *)(arg0) + 0x50));
        } else {
            D_80087940 = (*(void **)((u8 *)(arg0) + 0x50));
        }
        temp_a0_2 = (*(void **)((u8 *)(arg0) + 0x50));
        if (temp_a0_2 != NULL) {
            (*(void **)((u8 *)(temp_a0_2) + 0x4C)) = (void *) (*(void **)((u8 *)(arg0) + 0x4C));
        }
        func_800332C8(D_800726D0, (*(s32 *)((u8 *)(arg0) + 0x48)));
    }
}
