#include "types.h"

extern s16 D_800692B2;
extern u8 D_800784F4[];
extern u8 D_800784F8[];
extern u8 D_800785A4[];
extern u8 D_800785AC[];
extern u8 D_80078554[];
extern void func_8001F0C4(s32 index);
extern void func_80044F48(void *state, u8 a1, u8 a2);
extern void func_80044F6C(void *state, u32 index, u8 value, void *record);

void player_ui_state_configure(u32 index, u8 *record, void *table)
{
    register u32 original __asm__("$7") = index;
    register u8 *saved_record __asm__("$19");
    register u32 saved_index __asm__("$17");
    register u32 offset __asm__("$18");
    register u8 *state __asm__("$16");
    register u32 initial_index __asm__("$2");
    register u32 initial_offset __asm__("$3");
    register s32 mode __asm__("$4");
    register u32 field __asm__("$3");
    register s32 call_arg __asm__("$4");

    initial_index = original & 0xFF;
    initial_offset = initial_index << 5;
    initial_offset -= initial_index;
    initial_offset <<= 3;
    mode = D_800692B2;
    initial_offset += initial_index;
    initial_offset <<= 3;
    *(void **)(D_800784F4 + initial_offset) = table;
    saved_record = record;
    if (mode == 0) {
        D_800784F8[initial_offset] = 0xFF;
    } else {
        D_800784F8[initial_offset] = 0;
    }
    saved_index = original & 0xFF;
    initial_index = saved_index << 5;
    initial_index -= saved_index;
    initial_index <<= 3;
    field = saved_record[0x21];
    initial_index += saved_index;
    offset = initial_index << 3;
    *(u32 *)(D_800785AC + offset) = 0;
    D_800785A4[offset] = field;
    if (saved_index == 1) {
        __asm__("" : "=r"(saved_index) : "0"(saved_index));
        call_arg = 1;
        func_8001F0C4(call_arg);
        call_arg = 1;
        func_8001F0C4(call_arg);
    }
    func_8001F0C4(saved_index);
    state = D_80078554 + offset;
    func_80044F48(state, saved_record[0x10], saved_record[0xF]);
    func_80044F6C(state, saved_index, saved_record[0xD], saved_record);
}
