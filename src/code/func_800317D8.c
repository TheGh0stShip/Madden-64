#include "types.h"

extern s8 D_80086DE4[];
extern s8 D_800892D4[];
extern s8 D_800895D4[];
extern s32 D_8008B660[];

void func_800317D8(s16 arg0, s8 arg1, s8 arg2) {
    s8 slot;
    s32 flags;
    s8 v;

    slot = D_80086DE4[arg0];
    flags = D_8008B660[slot];
    if (flags & 1) {
        v = arg1 >> 3;
        if (v != 0) {
            if ((flags & 6) && D_800895D4[slot] >= 2) {
                if (D_800895D4[slot] < arg2) {
                    D_800895D4[slot] = arg2;
                    D_800892D4[D_80086DE4[arg0]] = v;
                }
            } else {
                D_800892D4[D_80086DE4[arg0]] = v;
                D_800895D4[D_80086DE4[arg0]] = arg2;
                D_8008B660[D_80086DE4[arg0]] |= 4;
            }
        }
    }
}
