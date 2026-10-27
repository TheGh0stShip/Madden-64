#include "types.h"

typedef struct RuntimeEntry {
    u32 field0;
    u32 value;
    u32 field8;
} RuntimeEntry;

extern u8 D_8008B078[];
extern u8 D_8008B07C[];
extern u8 D_8008B080[];
extern void func_800369A0(u32 value, u32 index);
extern u32 func_80032E00(u32 mode, u32 value);
extern void func_8003663C(u32 value, u32 index, u32 entry_value);
extern void func_80036100(u32 value, u32 index);

u32 func_80036160(u32 value, u32 index)
{
    register u32 saved_index __asm__("$17") = index;
    register u32 saved_value __asm__("$19") = (u16)value;
    register u32 table_offset __asm__("$16");
    register u32 entry_value __asm__("$20");
    register u32 result_offset __asm__("$18");
    u8 *flags;
    u32 *results;
    u32 rebuilt;

    __asm__("" : "=r"(saved_index), "=r"(saved_value)
            : "0"(saved_index), "1"(saved_value));
    func_800369A0(saved_value, saved_index);
    table_offset = saved_value * 24;
    flags = *(u8 **)(D_8008B080 + table_offset) + saved_index;
    *flags &= 0x7F;
    entry_value = (*(RuntimeEntry **)(D_8008B078 + table_offset))[saved_index].value;
    rebuilt = func_80032E00(0, entry_value);
    results = *(u32 **)(D_8008B07C + table_offset);
    result_offset = saved_index * 4;
    *(u32 *)((u8 *)results + result_offset) = rebuilt;
    func_8003663C(saved_value, saved_index, entry_value);
    func_80036100(saved_value, saved_index);
    flags = *(u8 **)(D_8008B080 + table_offset) + saved_index;
    *flags |= 0x20;
    result_offset += (u32)*(u8 **)(D_8008B07C + table_offset);
    return *(u32 *)result_offset;
}
