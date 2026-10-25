#include "types.h"

extern s32 D_800734E8;
extern s32 D_800734EC;
extern u8 D_80000400[];
extern u8 D_8007A530[];
extern s16 D_8007A534;
extern s32 func_800356C4(void* address, s32 size);

void func_8003C780(void) {
    register s32 index asm("$4");
    register u8* value asm("$3");
    register u32 fill asm("$5");

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
