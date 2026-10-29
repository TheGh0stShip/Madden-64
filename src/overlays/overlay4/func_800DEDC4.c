#include "types.h"

extern void func_800DE410(s16);
extern s32 func_800DD824(s32);
extern s16 func_800DE8D8(s32);
extern s32 *D_8007A178;
extern s16 D_800892B2;
extern u16 D_80085280;
extern u16 D_800857B2;
extern s32 D_80080C10;
extern s32 D_80089490[];
extern s16 D_80089598[];
extern s16 D_800886E0;
extern s16 D_80088AE4;

s16 func_800DEDC4(a)
    s16 a;
{
    s16 r;
    u8 t;

    func_800DE410(a);
    if (a != 4) {
        t = func_800DD824(D_8007A178[a + 9]);
    } else {
        t = func_800DD824(D_8007A178[8]);
    }
    r = -1;
    switch (a) {
    case 0:
        switch (t) {
        case 1:
            r = func_800DE8D8(1);
            break;
        case 2:
            r = D_800892B2;
            break;
        }
        break;
    case 1:
        break;
    case 2:
        r = 0;
        switch (t) {
        case 1:
            r = func_800DE8D8(1) | 0x8000;
            break;
        case 2:
            r = D_800892B2 | 0x8000;
            break;
        }
        break;
    case 3:
        if (t == 2) {
            r = -2;
        }
        break;
    case 4:
        switch (D_800892B2) {
        case 0xFD:
            if (!(D_80085280 & 0xC0)) {
                goto ff;
            }
            break;
        case 0xFC:
            if (D_80085280 & 0xC0) {
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

void func_800DD6EC(void) {
    s16 i;

    D_800857B2 = 0;
    D_80085280 = 0;
    i = 0;
    if (D_80080C10 & 4) {
        for (; D_80089490[i] != -1; i++) {
            if (D_80089598[D_80089490[i]] == D_800886E0) {
                D_80085280 = D_80089490[i] | 0x40;
                break;
            }
        }
    }
    i = 0;
    if (D_80080C10 & 2) {
        for (; D_80089490[i] != -1; i++) {
            if (D_80089598[D_80089490[i]] == D_80088AE4) {
                D_800857B2 = D_80089490[i] | 0x40;
                break;
            }
        }
    }
}
