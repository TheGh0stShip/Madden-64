#include "types.h"


extern s16 D_80086CB2;
typedef struct {
    s32 x;
    s32 y;
} Target;

extern Target D_80087A70;
extern u16 D_8008A5B2;
extern s32 D_8008B390;

void func_80034388(s32 *, s32);

void func_800C15C4(s32 *obj) {
    Target *target;

    obj[5] &= ~1;
    if ((u16)(D_8008A5B2 - 3) < 2 || D_8008A5B2 == 5) {
        target = &D_80087A70;
        if (target->x != 0x7FFFFFFF) {
            obj[5] |= 1;
            obj[7] = target->x;
            obj[8] = D_80087A70.y;
            obj[9] = 0;
            if (D_80086CB2 < 30) {
                if (D_80086CB2 < 20) {
                    if (D_80086CB2 < 10) {
                        D_8008B390 = 0x10A;
                        func_80034388(obj, 0x10A);
                    } else {
                        D_8008B390 = 0x109;
                        func_80034388(obj, 0x109);
                    }
                } else {
                    D_8008B390 = 0x108;
                    func_80034388(obj, 0x108);
                }
            } else {
                D_8008B390 = 0x107;
                func_80034388(obj, 0x107);
            }
        }
    }
}
