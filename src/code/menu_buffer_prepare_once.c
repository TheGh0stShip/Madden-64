#include "types.h"

extern u8 *D_8006B9DC;
extern u16 D_8006B9D8;
extern u16 D_8006B9E0;
extern u8 D_8006B9E4[];
extern s8 D_800C4EEB;
extern u16 D_80086190[];
extern u16 D_800855D4;
extern void func_80028744(u16 value, void *table);

void menu_buffer_prepare_once(void)
{
    if (*(u32 *)(D_8006B9DC + 0x5C04) == 0xCAACCAAC) {
        return;
    }

    if (D_8006B9D8 == 1) {
        func_80028744(D_8006B9E0, D_8006B9E4);
    } else if (D_8006B9D8 == 2) {
        func_80028744((u16)(s16)D_800C4EEB, D_80086190);
    }

    *(u32 *)(D_8006B9DC + 0x5C04) = 0xCAACCAAC;
    D_800855D4 = 1;
}
