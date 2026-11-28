#include "types.h"
u8 func_8000D684();                         /* extern */
u8 func_8000D834();                    /* extern */
u8 func_8000D874();       /* extern */
u8 func_80016FE4();                         /* extern */
u8 func_80032F3C();        /* extern */
u8 *func_800DD634();                                /* extern */
extern void *D_80080C8C;
extern u8 D_80082D98;
extern s8 D_80084FA8;
extern s32 D_800854A0;
extern void *D_80085BF0;
extern void *D_80085BF4;
extern s32 D_800879AC;
extern s32 D_80087AA8;
extern s32 D_8008931C;

void func_800CBC98(void *arg0) {
    s32 temp_a1_34;
    u8 *temp_s2_16;
    u8 *allocation;
    s32 temp_v0_26;
    s8 team;
    s32 var_a0_32;
    s32 var_a2_17;
    s32 var_a2_88;
    s32 var_v0_89;
    u16 *temp_v1_56;
    u8 *temp_a0_38;
    u8 *temp_a3_35;
    u8 *first_table;
    u8 *second_table;
    u8 *second_slot;
    s16 first_index;
    u16 *first_slot;
    void *temp_s0_11;
    u8 *temp_v0_93;

    temp_s0_11 = (*(void **)((u8 *)(arg0) + (0x64)));
    allocation = func_800DD634();
    team = D_80084FA8;
    temp_s2_16 = allocation;
    var_a2_17 = 0;
    temp_v0_26 = team * 0x214C;
    first_table = temp_v0_26 + &D_80082D98;
    second_table = temp_v0_26 + (&D_80082D98 + 0xC);
    do {
        var_a0_32 = var_a2_17 & 0xFFFF;
        temp_a1_34 = var_a0_32 * 4;
        temp_a3_35 = (u8 *)((u32)temp_a1_34 + (u32)first_table);
        first_index = (*(s16 *)((u8 *)(temp_s0_11) + 0x4E));
        first_slot = (u16 *)((u32)(2 * first_index) + (u32)temp_a3_35);
        temp_a0_38 = temp_s0_11 + (var_a0_32 * 2);
        *first_slot = (*(u16 *)((u8 *)(temp_a0_38) + (0x1E)));
        second_slot = (u8 *)((u32)temp_a1_34 + (u32)second_table);
        *(u16 *)(2 * (*(s16 *)((u8 *)(temp_s0_11) + 0x4E)) + second_slot) = (*(u16 *)((u8 *)(temp_a0_38) + (0xC))) & 0xDFFF;
        var_a2_17 += 1;
        if ((*(u16 *)((u8 *)(temp_a0_38) + (0xC))) & 0x2000) {
            temp_v1_56 = (u16 *)((u32)(2 * (*(s16 *)((u8 *)(temp_s0_11) + 0x4E))) + (u32)temp_a3_35);
            *temp_v1_56 |= 0x2000;
        }
    } while ((u32) (var_a2_17 & 0xFFFF) < 3U);
    func_8000D874(D_80087AA8, (*(s32 *)((u8 *)(arg0) + (0x60))), var_a2_17, temp_a3_35);
    func_8000D834(D_8008931C, (*(s32 *)((u8 *)(arg0) + (0x60))));
    func_8000D874(D_80087AA8, (*(s32 *)((u8 *)(temp_s0_11) + (0x28))));
    func_8000D834(D_8008931C, (*(s32 *)((u8 *)(temp_s0_11) + (0x28))));
    func_8000D684((*(s32 *)((u8 *)(temp_s0_11) + (0x30))));
    var_a2_88 = 0;
    do {
        var_v0_89 = var_a2_88 & 0xFFFF;
        var_a2_88 += 1;
        temp_v0_93 = (u8 *)((u32)(var_v0_89 * 4) + (u32)temp_s2_16);
        (*(s32 *)((u8 *)(temp_v0_93) + (0x20))) = 0;
        (*(s32 *)((u8 *)(temp_v0_93) + (0x50))) = 0;
        (*(s32 *)((u8 *)(temp_v0_93) + (0x44))) = 0;
        (*(s32 *)((u8 *)(temp_v0_93) + (0x5C))) = 0;
        (*(s32 *)((u8 *)(temp_v0_93) + (8))) = 0;
    } while ((u32) (var_a2_88 & 0xFFFF) < 3U);
    func_80032F3C(0, D_80085BF0, var_a2_88);
    func_80032F3C(0, D_80085BF4);
    func_80032F3C(0, D_80080C8C);
    func_80032F3C(0, temp_s0_11);
    func_80016FE4(D_800879AC);
    func_80016FE4(D_800854A0);
}
