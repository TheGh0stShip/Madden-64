#include "types.h"

typedef struct RuntimeEntry {
    u32 field0;
    u32 value;
    u32 field8;
} RuntimeEntry;

extern u8 D_800712F8;
extern u32 D_8007A500;
extern u8 D_8008B078[];
extern u8 D_8008B07C[];
extern u8 D_8008B080[];
extern void func_800363F4(u32 value);
extern void func_80036540(s32 value);
extern void func_800369A0(u32 value, u32 index);
extern void func_8003663C(u32 value, u32 index, u32 entry_value);
extern void func_80036100(u32 value, u32 index);

void func_80036268(u32 value, u32 index, u32 new_value)
{
    register u32 saved_index __asm__("$18") = index;
    register u32 saved_value __asm__("$17");
    register u32 saved_new_value __asm__("$19") = new_value;
    register u32 table_offset __asm__("$16");
    u32 entry_value;

    if (D_800712F8 != 0 && D_8007A500 == 0) {
        func_800363F4((u16)value);
        func_80036540(0);
        return;
    }

    saved_value = (u16)value;
    func_800369A0(saved_value, saved_index);
    table_offset = saved_value * 24;
    entry_value = (*(RuntimeEntry **)(D_8008B078 + table_offset))[saved_index].value;
    (*(u32 **)(D_8008B07C + table_offset))[saved_index] = saved_new_value;
    func_8003663C(saved_value, saved_index, entry_value);
    func_80036100(saved_value, saved_index);
    (*(u8 **)(D_8008B080 + table_offset))[saved_index] |= 0x20;
}
