#include "types.h"

typedef struct { u8 pad[0xC]; u8 *unkC; u8 pad10[0x28 - 0x10]; } Ent;
extern void func_800DDF10(s16);
extern s32 func_800DD824(s32);
extern s16 func_800DE8D8(s32);
extern void func_800DD6EC(void);
extern s32 *D_8007A178;
extern u16 D_800885D0;
extern s16 D_800892B2;
extern Ent *D_80088094;
extern s32 D_80080C10;
extern s16 D_80089354;
extern u16 D_800857B2;

s16 func_800DEB2C(s16 a) {
    s16 r;
    u8 t;
    s16 c;

    func_800DDF10(a);
    r = -1;
    t = func_800DD824(D_8007A178[a + 4]);
    switch (a) {
    case 0:
        switch (t) {
        case 1:
            r = func_800DE8D8(0);
            break;
        case 2:
            r = D_800892B2;
            break;
        }
        break;
    case 1:
        r = D_800885D0;
        if (t == 3) {
            break;
        }
        if (t == 4) {
            c = D_80088094[r].unkC[D_800892B2];
            if (c != 0x7F) {
                r = c;
            }
        }
        break;
    case 2:
        r = 0;
        switch (t) {
        case 1:
            r = func_800DE8D8(0) | 0x8000;
            break;
        case 2:
            r = D_800892B2 | 0x8000;
            break;
        }
        break;
    case 3:
        if (t == 2) {
            switch (D_800892B2) {
            case 0xFE:
                D_80080C10 |= 0x20;
                r = -1;
                break;
            case 0xFD:
                D_80080C10 |= 0x1000;
                r = -1;
                break;
            case 0xFC:
                D_80089354 = 0x28;
                r = -1;
                break;
            case 0xFF:
                r = -2;
                break;
            }
        }
        break;
    case 4:
        func_800DD6EC();
        switch (D_800892B2) {
        case 0xFD:
            if (!(D_800857B2 & 0xC0)) {
                goto ff;
            }
            break;
        case 0xFC:
            if (D_800857B2 & 0xC0) {
                break;
            }
        case 0xFE:
            r = 0xFE;
            break;
        case 0xFF:
        ff:
            r = 0xFF;
            break;
        }
        break;
    }
    return r;
}
