#include "types.h"

extern void *D_800E6B78[];
extern u8 D_80080C90;
extern u8 D_8006BC68;

extern u8 *func_8003AA28(u16 id);
extern void func_8002E65C(void *destination, void *source);
extern void func_800167FC(s32 value, void *destination);
extern u8 func_80024B90(u16 id);
extern void func_8003A7DC(u8 value, void *destination);
extern void func_800D39FC(s16 id, void *position, s16 y, s32 value, s32 type);

void func_800D3894(
    s16 id,
    s16 y,
    u8 *base,
    s16 row,
    void *destination1,
    void *destination2,
    void *destination3,
    void *destination4,
    s32 firstValue,
    s32 secondValue
) {
    u8 *source;
    u8 code;
    s32 row_offset;

    source = func_8003AA28((u16)id);
    func_8002E65C(destination1, source);
    func_800167FC(source[0xD], destination2);
    func_8002E65C(destination3, D_800E6B78[source[0xE] & 0x3F]);
    code = func_80024B90((u16)id);
    if (code != 0xFF) {
        func_8003A7DC(func_80024B90((u16)id), &D_80080C90);
        func_8002E65C(destination4, &D_80080C90 + 0x55);
    } else {
        func_8002E65C(destination4, &D_8006BC68);
    }
    row_offset = row * 8;
    func_800D39FC(id, base + (row_offset + 0xC), y, firstValue, 4);
    row_offset += 0x14;
    func_800D39FC(id, base + row_offset, y, secondValue, 4);
}
