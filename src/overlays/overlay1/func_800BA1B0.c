#include "types.h"

#ifndef NULL
#define NULL 0
#endif

s32 func_800B5028(u16);                         /* extern */
u16 func_800B5D88(u16);                             /* extern */
s32 func_800B74FC();                            /* extern */
typedef struct {
    u8 unk00[8];
    u32 unk08;
    u8 unk0C[4];
} Entry10;

extern u8 *D_800718E8;
extern u16 D_80087AC4;
extern s16 D_8008AF80;
extern u16 D_8008AFD2;

void func_800BA1B0(void) {
    u16 temp_v0;

    if (D_80087AC4 == *(u16 *)(D_800718E8 + 0xA)) {
        D_8008AF80 = 1;
        return;
    }
    temp_v0 = D_8008AFD2 + ((*(u32 *)(D_800718E8 + (D_80087AC4 << 4) + 0x48) >> 7) & 0xF);
    D_8008AFD2 = temp_v0;
    if ((s16) temp_v0 >= 6) {
        D_8008AFD2 = 0;
        func_800B5028(D_80087AC4);
        D_80087AC4 = func_800B5D88(D_80087AC4);
        func_800B74FC();
    }
}
