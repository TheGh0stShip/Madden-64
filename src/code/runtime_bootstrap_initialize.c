#include "types.h"

extern s32 D_800734E8;
extern s32 D_800734EC;
extern u8 D_80000400[];
extern u8 D_8007A530[];
extern s16 D_8007A534;
extern s32 func_800356C4(void* address, s32 size);

void func_8003C780(void) {
    s32 index;
    u8* value;
    u32 fill;

    D_800734EC = 0;
    D_8007A534 = func_800356C4(D_80000400, 0x48);
    fill = 0xFF;
    index = 1;
    value = &D_8007A530[1];
    do {
        *value = fill;
        index--;
        value--;
    } while (index >= 0);
    D_800734E8 = 1;
}
