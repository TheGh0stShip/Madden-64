#include "types.h"

extern volatile u8 D_80081602[];
extern u16 D_8008B672;
extern void func_8003B9C0(u16 value, u16 index, u16 copy);

void func_800373B4(u32 value)
{
    u32 saved_value = value;
    u32 row = 0;
    u32 column;
    u32 row_offset;

    do {
        column = 0;
        row_offset = (u16)row * 8524;
        do {
            u32 offset = (u16)column * 3 + row_offset;

            D_80081602[offset + 0] = 0;
            D_80081602[offset + 1] = 0;
            D_80081602[offset + 2] = 0;
            column++;
        } while ((u16)column < 55);
        row++;
    } while ((u16)row < 2);

    row = 0;
    if ((D_8008B672 >> 1) != 0) {
        do {
            func_8003B9C0((u16)saved_value, (u16)row, (u16)row);
            row++;
        } while ((u16)row < (D_8008B672 >> 1));
    }
}
