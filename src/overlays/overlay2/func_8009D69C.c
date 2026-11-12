#include "types.h"

extern s8 D_800C4AD2;
extern s8 D_80072028[];
extern s8 D_80072030[];
extern u8 D_800C4E6C[];

u8 *func_8009D69C(s32 index, s32 offset) {
    s32 entry = D_800C4AD2;

    if (entry == 4) {
        entry = D_80072028[index];
    } else {
        entry = D_80072030[index];
    }
    entry += offset;
    return D_800C4E6C + entry * 6;
}
