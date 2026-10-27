#include "types.h"

extern volatile u8 D_80081602[];
extern u16 D_8008B672;
extern void func_8003B9C0(u16 value, u16 index, u16 copy);

void func_800373B4(u32 value)
{
    register u32 saved_value __asm__("$17") = value;
    register u32 row __asm__("$16") = 0;
    register u32 column __asm__("$4");
    register u32 row_offset __asm__("$5");

    do {
        column = 0;
        row_offset = (u16)row * 8524;
        do {
            u32 offset = row_offset + (u16)column * 3;

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
