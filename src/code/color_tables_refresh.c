#include "types.h"

extern void *D_8008A3E0;
extern u8 D_80074A38[];
extern u8 D_80074A3C[];
extern void func_8000DE34(void *context);
extern u8 *func_8000DF10(void);
extern u8 *func_8000E02C(u32 value);

void color_tables_refresh(void)
{
    u8 *source;
    u32 index;

    func_8000DE34(D_8008A3E0);
    source = func_8000DF10();
    index = 0;
    do {
        D_80074A38[(u16)index] = source[(u16)index] - 0x10;
        index++;
    } while ((u16)index < 3);
    source = func_8000E02C(0);
    index = 0;
    do {
        D_80074A3C[(u16)index] = source[(u16)index] + 0x20;
        index++;
    } while ((u16)index < 3);
}
