#include "types.h"

typedef struct {
    /* 0x00 */ u8 unk_00[0x1E];
    /* 0x1E */ u8 unk_1E;
} Actor;

typedef struct {
    /* 0x0000 */ u16 unk_00;
    /* 0x0002 */ u8 unk_02[0x214A];
} Side;

u16 func_80031A1C(s32);
void func_80041BB4(s32 type);
void func_80041BDC(s32, s32);
void func_80041C48(u16 value);
void func_800B7BC0(s32 *source);
s16 func_800B932C(s16, s32);
s32 object_indexed_value_get(void *);

extern s32 D_8006DEE4;
extern s32 D_800724AC;
extern s32 D_8007A420[];
extern Actor *D_8007A448;
extern s32 D_8007A44C;
extern s16 *D_8007A450;
extern s32 D_8007A454;
extern s32 D_80080C0C;
extern s32 D_80080C10;
extern Side D_80082D94[];
extern s32 D_80084F34;
extern s16 D_800876DC;
extern s16 D_80087AAC;
extern u32 D_80088620;
extern s16 D_800886E0;
extern s16 D_80088AE4;
extern void *D_8008AF88;
extern u32 D_8008B788;


void func_800B7DD8(u8 arg0, u32 arg1, u32 arg2, s32 arg3) {
    s32 flag;

    switch (arg0) {
        case 0:
            D_8007A420[0] = object_indexed_value_get(&D_800724AC);
            switch (arg1) {
                case 0:
                    if (arg2 != 10) {
                        if (arg2 != -1) {
                            return;
                        }
                        D_8007A420[1] = 0x85;
                    } else {
                        D_8007A420[1] = 0x84;
                    }
                    break;
                case 1:
                    if (arg2 == -1) {
                        D_8007A420[1] = 0x86;
                    } else if (arg2 < 11 && arg2 != 0) {
                        if (D_800876DC == 4 && D_80087AAC < 0x78 && D_80084F34 < 0) {
                            if (D_80082D94[D_80088AE4].unk_00 < D_80082D94[D_800886E0].unk_00 &&
                                D_80082D94[D_80088AE4].unk_00 + 7 >= D_80082D94[D_800886E0].unk_00) {
                                func_80041BDC(0x13, 0x1E);
                            }
                        }
                        return;
                    } else if (arg2 == 0) {
                        D_8007A420[1] = 0x8C;
                        if (func_80031A1C(100) < 0x2D) {
                            D_8007A420[1] = 0x8F;
                        }
                    } else if (arg2 >= 11) {
                        D_8007A420[1] = 0x89;
                    }
                    break;
                case 2:
                    if (arg2 == -1) {
                        D_8007A420[1] = 0x87;
                    } else if (arg2 < 11 && arg2 != 0) {
                        return;
                    } else if (arg2 == 0) {
                        D_8007A420[1] = 0x8D;
                        if (func_80031A1C(100) < 0x2D) {
                            D_8007A420[1] = 0x90;
                        }
                    } else if (arg2 >= 11) {
                        D_8007A420[1] = 0x8A;
                    }
                    break;
                case 3:
                    if (arg2 == -1) {
                        D_8007A420[1] = 0x88;
                    } else if (arg2 < 11 && arg2 != 0) {
                        return;
                    } else if (arg2 == 0) {
                        D_8007A420[1] = 0x8E;
                        if (func_80031A1C(100) < 0x2D) {
                            D_8007A420[1] = 0x91;
                        }
                    } else if (arg2 >= 11) {
                        D_8007A420[1] = 0x8B;
                    }
                    break;
            }
            D_8007A420[2] = -1;
            if (D_80088620 >= D_8008B788 + 0x960 || D_8007A420[1] != D_80080C0C) {
                func_800B7BC0(D_8007A420);
                D_8008B788 = D_80088620;
                D_80080C0C = D_8007A420[1];
            }
            break;
        case 1:
            D_8007A448 = (Actor *)arg2;
            switch (arg1) {
                case 2:
                    D_8007A420[0] = 0xE3;
                    D_8007A420[1] = 0xE9;
                    D_8007A420[2] = func_80031A1C(3) + 0xD3;
                    D_8007A420[3] = -1;
                    func_800B7BC0(D_8007A420);
                    break;
                case 1:
                case 16:
                case 18:
                    D_8007A420[0] = 0xE3;
                    flag = D_80080C10 & 1;
                    {
                        s32 own;

                        if ((D_8007A448->unk_1E == D_80088AE4) ? (own = flag ^ 1) : flag) {
                        D_8007A420[1] = func_80031A1C(3) + 0xD6;
                    } else {
                        D_8007A420[1] = func_80031A1C(3) + 0xD3;
                        }
                    }
                    D_8007A420[2] = -1;
                    func_800B7BC0(D_8007A420);
                    break;
                case 0:
                    D_8007A420[0] = 0xE3;
                    D_8007A420[1] = func_80031A1C(3) + 0xEA;
                    D_8007A420[2] = func_80031A1C(3) + 0xD3;
                    D_8007A420[3] = -1;
                    func_800B7BC0(D_8007A420);
                    break;
                case 3:
                    D_8007A420[0] = 0xE3;
                    D_8007A420[1] = func_80031A1C(3) + 0xEA;
                    D_8007A420[2] = func_80031A1C(3) + 0xD6;
                    D_8007A420[3] = -1;
                    func_800B7BC0(D_8007A420);
                    break;
                case 9:
                    D_8007A420[0] = 0xE3;
                    D_8007A420[1] = 0xE7;
                    flag = D_80080C10 & 1;
                    {
                        s32 own;

                        if ((D_8007A448->unk_1E == D_80088AE4) ? (own = flag ^ 1) : flag) {
                        D_8007A420[2] = func_80031A1C(3) + 0xD6;
                    } else {
                        D_8007A420[2] = func_80031A1C(3) + 0xD3;
                        }
                    }
                    D_8007A420[3] = -1;
                    func_800B7BC0(D_8007A420);
                    break;
                case 4:
                    D_8007A420[0] = 0xE8;
                    flag = D_80080C10 & 1;
                    {
                        s32 own;

                        if ((D_8007A448->unk_1E == D_80088AE4) ? (own = flag ^ 1) : flag) {
                        D_8007A420[1] = func_80031A1C(3) + 0xD6;
                    } else {
                        D_8007A420[1] = func_80031A1C(3) + 0xD3;
                        }
                    }
                    D_8007A420[2] = -1;
                    func_800B7BC0(D_8007A420);
                    break;
                case 14:
                    D_8007A420[0] = 0xE3;
                    D_8007A420[1] = 0xE8;
                    flag = D_80080C10 & 1;
                    {
                        s32 own;

                        if ((D_8007A448->unk_1E == D_80088AE4) ? (own = flag ^ 1) : flag) {
                        D_8007A420[2] = func_80031A1C(3) + 0xD6;
                    } else {
                        D_8007A420[2] = func_80031A1C(3) + 0xD3;
                        }
                    }
                    D_8007A420[3] = -1;
                    func_800B7BC0(D_8007A420);
                    break;
                case 17:
                    D_8007A420[0] = 0xE5;
                    D_8007A420[1] = -1;
                    func_800B7BC0(D_8007A420);
                    break;
                case 5:
                    D_8007A420[0] = 0xE4;
                    D_8007A420[1] = func_80031A1C(3) + 0xD3;
                    D_8007A420[2] = -1;
                    func_800B7BC0(D_8007A420);
                    break;
                case 6:
                    D_8007A420[0] = 0xE4;
                    D_8007A420[1] = func_80031A1C(3) + 0xD6;
                    D_8007A420[2] = -1;
                    func_800B7BC0(D_8007A420);
                    break;
                case 7:
                    D_8007A420[0] = 0xDF;
                    flag = D_80080C10 & 1;
                    {
                        s32 own;

                        if ((D_8007A448->unk_1E == D_80088AE4) ? (own = flag ^ 1) : flag) {
                        D_8007A420[1] = func_80031A1C(3) + 0xD6;
                    } else {
                        D_8007A420[1] = func_80031A1C(3) + 0xD3;
                        }
                    }
                    D_8007A420[2] = -1;
                    func_800B7BC0(D_8007A420);
                    break;
                case 8:
                    D_8007A420[0] = 0xDE;
                    flag = D_80080C10 & 1;
                    {
                        s32 own;

                        if ((D_8007A448->unk_1E == D_80088AE4) ? (own = flag ^ 1) : flag) {
                        D_8007A420[1] = func_80031A1C(3) + 0xD6;
                    } else {
                        D_8007A420[1] = func_80031A1C(3) + 0xD3;
                        }
                    }
                    D_8007A420[2] = -1;
                    func_800B7BC0(D_8007A420);
                    break;
                case 10:
                    D_8007A420[0] = 0xE0;
                    D_8007A420[1] = func_80031A1C(3) + 0xD6;
                    D_8007A420[2] = -1;
                    func_800B7BC0(D_8007A420);
                    break;
                case 11:
                    D_8007A420[0] = 0xDC;
                    D_8007A420[1] = func_80031A1C(3) + 0xD6;
                    D_8007A420[2] = -1;
                    func_800B7BC0(D_8007A420);
                    break;
                case 12:
                    D_8007A420[0] = 0xE2;
                    D_8007A420[1] = func_80031A1C(3) + 0xD3;
                    D_8007A420[2] = -1;
                    func_800B7BC0(D_8007A420);
                    break;
                case 13:
                    D_8007A420[0] = 0xDD;
                    D_8007A420[1] = func_80031A1C(3) + 0xD3;
                    D_8007A420[2] = -1;
                    func_800B7BC0(D_8007A420);
                    break;
                case 19:
                    D_8007A420[0] = 0xCE;
                    D_8007A420[1] = -1;
                    func_800B7BC0(D_8007A420);
                    break;
                case 20:
                    if (arg2 != 0) {
                        D_8007A420[0] = arg3 + 0xD1;
                    } else {
                        D_8007A420[0] = arg3 + 0xCF;
                    }
                    D_8007A420[1] = -1;
                    func_800B7BC0(D_8007A420);
                    break;
                case 23:
                    D_8007A420[0] = func_80031A1C(3) + 0xD9;
                    D_8007A420[1] = -1;
                    func_800B7BC0(D_8007A420);
                    break;
                case 24:
                    D_8007A420[0] = 0xE1;
                    D_8007A420[1] = -1;
                    func_800B7BC0(D_8007A420);
                    break;
                case 22:
                    D_8007A420[0] = 0xE6;
                    if (arg2 == D_80088AE4) {
                        D_8007A420[1] = func_80031A1C(2) + 0xD6;
                    } else {
                        D_8007A420[1] = func_80031A1C(2) + 0xD3;
                    }
                    D_8007A420[2] = -1;
                    func_800B7BC0(D_8007A420);
                    break;
            }
            break;
        case 2:
            switch (arg1) {
                case 0:
                    func_80041C48(0x61);
                    break;
                case 1: {
                    s32 diff;

                    D_8007A450 = (s16 *)arg2;
                    diff = func_800B932C(0, *D_8007A450);
                    if (diff < 0) {
                        diff = -diff;
                    }
                    if (diff >= 0x32) {
                        func_80041BB4(0xD);
                        break;
                    }
                    D_8007A44C = 0;
                    if (D_8008AF88 == &D_8006DEE4) {
                        D_8007A420[D_8007A44C++] = func_80031A1C(3) + 0xB0;
                        D_8007A420[D_8007A44C++] = -1;
                        func_800B7BC0(D_8007A420);
                    }
                    break;
                }
                case 2: {
                    s32 diff;

                    D_8007A450 = (s16 *)arg2;
                    diff = func_800B932C(0, *D_8007A450);
                    D_8007A454 = diff;
                    if (diff < 0) {
                        diff = -diff;
                    }
                    if (diff >= 0x32) {
                        func_80041BB4(0xA);
                    }
                    break;
                }
                case 3:
                    if (arg2 != 0 && (D_80080C10 & 0x40000)) {
                        D_8007A420[0] = func_80031A1C(6) + 0xA8;
                    } else {
                        D_8007A420[0] = func_80031A1C(3) + 0xAB;
                    }
                    D_8007A420[1] = -1;
                    func_800B7BC0(D_8007A420);
                    break;
                case 4:
                    if (arg2 != 0) {
                        D_8007A420[0] = func_80031A1C(3) + 0xBD;
                        break;
                    }
                    D_8007A420[0] = 0xBC;
                    D_8007A420[1] = -1;
                    func_800B7BC0(D_8007A420);
                    break;
                case 5:
                    if (arg2 != 0) {
                        D_8007A420[0] = 0x9A;
                    } else {
                        D_8007A420[0] = 0x99;
                    }
                    D_8007A420[1] = -1;
                    func_800B7BC0(D_8007A420);
                    break;
                case 7:
                    D_8007A420[0] = func_80031A1C(2) + 0xA4;
                    D_8007A420[1] = -1;
                    func_800B7BC0(D_8007A420);
                    break;
                case 8:
                    D_8007A420[0] = func_80031A1C(5) + 0xAB;
                    D_8007A420[1] = -1;
                    func_800B7BC0(D_8007A420);
                    break;
                case 9:
                    D_8007A420[0] = 0x9B;
                    D_8007A420[1] = -1;
                    func_800B7BC0(D_8007A420);
                    break;
                case 10:
                    D_8007A420[0] = arg2 + 0x99;
                    D_8007A420[1] = -1;
                    func_800B7BC0(D_8007A420);
                    break;
                case 11:
                    D_8007A420[0] = func_80031A1C(5) + 0xB3;
                    D_8007A420[1] = -1;
                    func_800B7BC0(D_8007A420);
                    break;
                case 12:
                    D_8007A420[0] = func_80031A1C(3) + 0x9C;
                    D_8007A420[1] = -1;
                    func_800B7BC0(D_8007A420);
                    break;
                case 24:
                    if (arg2 != 0) {
                        D_8007A420[0] = func_80031A1C(4) + 0xBD;
                    } else {
                        D_8007A420[0] = func_80031A1C(3) + 0xBD;
                    }
                    D_8007A420[1] = -1;
                    func_800B7BC0(D_8007A420);
                    break;
                case 15:
                    D_8007A44C = 0;
                    if (D_80082D94[D_80088AE4].unk_00 > D_80082D94[D_800886E0].unk_00 + 0x18 &&
                        func_80031A1C(100) < 0x1E) {
                        func_80041BB4(0x1A);
                    }
                    D_8007A420[0] = func_80031A1C(4) + 0xB8;
                    D_8007A420[1] = -1;
                    func_800B7BC0(D_8007A420);
                    break;
                case 16:
                    D_8007A420[0] = func_80031A1C(5) + 0x9F;
                    D_8007A420[1] = -1;
                    func_800B7BC0(D_8007A420);
                    break;
                case 17:
                    D_8007A420[0] = func_80031A1C(4) + 0xA4;
                    D_8007A420[1] = -1;
                    func_800B7BC0(D_8007A420);
                    break;
                case 18:
                    D_8007A420[0] = func_80031A1C(3) + 0xC1;
                    D_8007A420[1] = -1;
                    func_800B7BC0(D_8007A420);
                    break;
            }
            break;
    }
}
