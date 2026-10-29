#include "types.h"

u8 func_80024B90(u16);
u8 func_80024BD4(u16);
extern u16 D_8006B9D8;
extern u16 D_8006B9E0;
extern u16 D_8006B9E4[];
extern u16 D_80086190[];
extern s8 D_800C4EEB;

u16 func_8002C304(u16 arg0) {
    u16 a;
    u16 b;
    u16 *list;
    u16 count;
    u16 i;

    a = func_80024B90(arg0);
    b = func_80024BD4(arg0);
    if (D_8006B9D8 == 2) {
        list = D_80086190;
        count = D_800C4EEB;
    } else {
        count = D_8006B9E0;
        list = D_8006B9E4;
    }
    if (a != 0xFF) {
        for (i = 0; i < count; i++) {
            if (list[i] == a) {
                a = i;
                break;
            }
        }
    } else {
        a = 0x1E;
    }
    b += a * 0x37;
    return b;
}
