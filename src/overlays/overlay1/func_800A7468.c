#include "types.h"

#ifndef NULL
#define NULL 0
#endif

extern u16 D_8006A7C0[];
extern u8 *D_8008A724[];

void func_8000B7A4(s32, u16);

void func_800A7468(u8 *obj) {
    s16 i;

    for (i = 0; i < 1; i++) {
        if (D_8008A724[i] == NULL) {
            D_8008A724[i] = obj;
            break;
        }
    }
    func_8000B7A4(*(s32 *)(obj + 0x14), D_8006A7C0[*(s16 *)(obj + 2)]);
}
