#include "types.h"

extern u8 D_80071730[];
extern u8 D_80071738[];
extern s16 D_800692B2;
extern volatile u8 D_800784F4[];
extern u8 D_800784F8[];
extern u8 D_800785A4[];
extern u8 D_800785AC[];
extern u8 D_80078554[];
extern void func_8001F0C4(s32 index);
extern void func_80044F48(void *state, u8 a1, u8 a2);
extern void func_80044F6C(void *state, u32 index, u8 value, void *record);

void menu_player_process(u32 index, u8 *record)
{
    register u8 *saved_record __asm__("$19") = record;
    register u32 original __asm__("$6");
    register u32 saved_index __asm__("$17");
    register u32 offset __asm__("$18");
    register u8 *state __asm__("$16");
    register u32 work __asm__("$2");
    register u32 record_offset __asm__("$3");
    register u32 field __asm__("$3");
    register s32 call_arg __asm__("$4");
    register u32 player __asm__("$3");
    register u32 selector __asm__("$4");

    work = saved_record[0xE];
    original = index;
    __asm__("" : "=r"(original) : "0"(original));
    selector = work & 0x3F;
    __asm__("" : "=r"(selector) : "0"(selector));

    if (selector == 0) {
        if (saved_record[0x20] == 0) {
            work = original & 0xFF;
            record_offset = work << 5;
            record_offset -= work;
            record_offset <<= 3;
            record_offset += work;
            record_offset <<= 3;
            work = (u32)D_80071730;
            *(u32 *)(D_800784F4 + record_offset) = work;
            __asm__("" : : "r"(record_offset) : "memory");
        } else {
            work = original & 0xFF;
            record_offset = work << 5;
            record_offset -= work;
            record_offset <<= 3;
            record_offset += work;
            record_offset <<= 3;
            work = (u32)D_80071738;
            *(u32 *)(D_800784F4 + record_offset) = work;
            __asm__("" : : "r"(saved_record) : "memory");
        }
    } else {
        player = original & 0xFF;
        work = player << 5;
        work -= player;
        work <<= 3;
        work += player;
        work <<= 3;
        record_offset = selector << 3;
        call_arg = (u32)D_80071738;
        record_offset += call_arg;
        *(u32 *)(D_800784F4 + work) = record_offset;
        __asm__("" : : "r"(selector) : "memory");
    }

    work = D_800692B2;
    if (work == 0) {
        work = original & 0xFF;
        record_offset = work << 5;
        record_offset -= work;
        record_offset <<= 3;
        record_offset += work;
        record_offset <<= 3;
        D_800784F8[record_offset] = 0xFF;
    } else {
        player = original & 0xFF;
        work = player << 5;
        work -= player;
        work <<= 3;
        work += player;
        work <<= 3;
        D_800784F8[work] = 0;
    }
    saved_index = original & 0xFF;
    work = saved_index << 5;
    work -= saved_index;
    work <<= 3;
    field = saved_record[0x21];
    work += saved_index;
    offset = work << 3;
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
