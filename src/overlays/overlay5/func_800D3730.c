#include "types.h"

typedef struct ResourceTableD3730 {
    void* items[64];
} ResourceTableD3730;

extern ResourceTableD3730 D_800E6B78;
extern u8 D_80080CE5[];

extern void* func_80022A3C(u16 group, u16 id);
extern u8 func_80022A88(u16 group, u16 id);
extern s32 func_80022AD8(u16 group, u16 id);
extern void func_8002E65C(void* destination, void* source);
extern void func_800167FC(s32 value, void* destination);
extern void func_800D39FC(s16 id, void* position, s16 y, s32 value,
                          s32 type);

void func_800D3730(
    s16 id,
    s16 y,
    u8* base,
    s16 row,
    void* destination1,
    void* destination2,
    void* destination3,
    void* destination4,
    s32 firstValue,
    s32 secondValue
) {
    s32 code;
    s32 row_offset;

    func_8002E65C(destination1, func_80022A3C((u16)y, (u16)id));
    func_800167FC(func_80022A88((u16)y, (u16)id), destination2);
    code = func_80022AD8((u16)y, (u16)id);
    func_8002E65C(destination3, D_800E6B78.items[code & 0x3F]);
    func_8002E65C(destination4, D_80080CE5 + ((s16)y * 0x214C));
    row_offset = row * 8;
    func_800D39FC(id, base + (row_offset + 0xC), y, firstValue, 0);
    row_offset += 0x14;
    func_800D39FC(id, base + row_offset, y, secondValue, 0);
}
