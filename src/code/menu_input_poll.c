#include "types.h"

extern u32 D_80080C10;
extern s16 D_800894FC;
extern u16 D_8006B7A8;
extern u8 *D_80086178;
extern u32 func_8001FA68(u32 command, u32 value, u32 first, u32 second);
extern void func_8009CBB8(u32 command, u32 value);

void menu_input_poll(u8 *menu)
{
    u8 *first;
    u8 *second;
    u32 result;

    if ((D_80080C10 & 0x4000) != 0) return;
    if (D_800894FC != 0) return;
    if (D_8006B7A8 != 0) return;
    if ((*(u16 *)(menu + 0x28) & 8) == 0) return;
    if (*(s16 *)(menu + 0x30) <= 0) return;

    first = *(u8 **)(menu + 0x24);
    second = D_80086178;
    result = func_8001FA68(0x0C, *(u32 *)(menu + 0x38),
                           *(u32 *)(first + 0x20),
                           *(u32 *)(second + 0x20));
    if ((s16)result == 1) {
        func_8009CBB8(0x2D, 0xD2);
    }
}
