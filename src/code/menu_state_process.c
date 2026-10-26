#include "types.h"

extern s16 D_800692B2;
extern u8 D_800784F8[];
extern u8 D_800784F4[];
extern u8 D_800784FC[];
extern u8 D_800785AC[];
extern void *D_80086DD8;
extern u8 D_800908B8[];
extern void func_800353B0(void);
extern u16 func_80034D30(u32 value, s32 arg1, s32 arg2);
extern u8 func_80035380(u32 value);
extern void func_80035064(void *state, u32 value, s32 arg2);
extern void func_80034388(void *state, u32 value);

void menu_state_process(s32 index)
{
    register s32 saved_index __asm__("$17") = index;
    register u32 value __asm__("$16");
    register u32 first_offset __asm__("$2");
    register u32 offset __asm__("$5");
    register u32 final_offset __asm__("$4");
    register u32 *table __asm__("$3");
    register u32 *reset_table __asm__("$2");

    __asm__("" : "=r"(saved_index) : "0"(saved_index));
    if (D_800692B2 == 0) {
        first_offset = saved_index * 0x7C8;
        D_800784F8[first_offset]++;
    }
    __asm__("" : "=r"(saved_index) : "0"(saved_index));
    first_offset = saved_index << 5;
    first_offset -= saved_index;
    first_offset <<= 3;
    first_offset += saved_index;
    offset = first_offset << 3;
    table = *(u32 **)(D_800784F4 + offset);
    __asm__("" : "=r"(table) : "0"(table) : "memory");
    table = *(u32 **)table;
    value = table[D_800784F8[offset]];
    if (value == 0) {
        D_800784F8[offset] = 0;
        reset_table = *(u32 **)(D_800784F4 + offset);
        __asm__("" : "=r"(reset_table) : "0"(reset_table) : "memory");
        reset_table = *(u32 **)reset_table;
        value = reset_table[0];
    }
    *(u32 *)(D_800785AC + offset) = 0;
    if ((value & 0xFF00) > 0x200) {
        if (D_80086DD8 != D_800908B8) {
            func_80034388(D_800784FC + offset, 0x60045);
        } else {
            func_800353B0();
            if (func_80034D30(value, 2, 0) != 0) {
                while (func_80035380(value) == 0) {
                }
                final_offset = saved_index * 0x7C8;
                first_offset = (u32)D_800784FC;
                func_80035064((void *)(final_offset + first_offset), value, 0);
            }
        }
    } else {
        func_80034388(D_800784FC + offset, value);
    }
}
