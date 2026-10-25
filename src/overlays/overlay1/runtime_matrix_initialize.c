#include "types.h"

extern u8 D_8006EA70;
extern void *D_8006EA74;
extern s32 D_8006EA78;
extern s32 D_8008AFA8[2][2];

extern void *func_80032E00(s32 type, s32 size);
extern void func_800AFA30(void);

void runtime_matrix_initialize(void)
{
    u32 row;
    u32 column;
    s32 *row_values;
    s32 *entry;

    D_8006EA70 = 1;
    D_8006EA74 = func_80032E00(0, 0x48C);
    D_8006EA78 = 0;
    func_800AFA30();
    row = 0;
    row_values = &D_8008AFA8[0][0];
    do {
        column = 0;
        entry = row_values;
        do {
            *entry++ = 0;
            column++;
        } while (column < 2);
        row++;
        row_values += 2;
    } while (row < 2);
}
