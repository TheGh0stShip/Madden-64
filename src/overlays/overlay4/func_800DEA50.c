#include "types.h"


void *func_80035EF0(s32, s32);                  /* extern */
s32 func_80036570(void *, void *, s32, u16, s32, s32); /* extern */
extern void *D_8007A178;
extern void *D_800869EC;
extern void *D_800895DC;
extern void *D_8008AF8C;

void func_800DEA50(s32 arg0) {
    s32 temp_s1;
    void *temp_v0;
    void *temp_v0_2;
    void *temp_v0_3;

    temp_s1 = arg0 & 0xFFFF;
    temp_v0 = func_80035EF0(temp_s1, 0x2D);
    D_8007A178 = temp_v0;
    func_80036570(temp_v0, temp_v0, 4, 0xEU, 4, 0);
    temp_v0_2 = func_80035EF0(temp_s1, 0x2E);
    D_800895DC = temp_v0_2;
    func_80036570(temp_v0_2 + 4, temp_v0_2, 4, (*(u16 *)((u8 *)(temp_v0_2) + 2)), 4, 0);
    temp_v0_3 = func_80035EF0(temp_s1, 0x2F);
    D_8008AF8C = temp_v0_3;
    func_80036570(temp_v0_3, temp_v0_3, 4, (*(u16 *)((u8 *)(D_800895DC) + 2)), 4, 0);
    D_800869EC = func_80035EF0(temp_s1, 0x30);
}
