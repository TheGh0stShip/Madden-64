#include "types.h"
/* Field access at a byte offset from a base whose layout is not yet named. */
#define M2C_FIELD(expr, type_ptr, offset) (*(type_ptr)((s8 *)(expr) + (offset)))

#ifndef NULL
#define NULL 0
#endif
extern u8 D_80073524[];
extern u8 D_80073523[];
extern u8 D_80086DDC[];

s32 func_8000B2E0(s32 *);                   /* extern */
s32 func_8000B6F8(s32, s32);                /* extern */
s32 func_8000BE80();                            /* extern */
s32 func_8000BF08();                            /* extern */
s32 func_8000C898(s32, s32);                    /* extern */
s32 func_8000C8AC(s32);                         /* extern */
s32 func_8000C8BC(s32);                         /* extern */
s32 func_8000C930(s32 *, s32, s32, s32); /* extern */
s32 func_8000C940(s32, s32, s32);       /* extern */
s32 func_8000C964(s32, s32, s32);       /* extern */
s32 func_8000C9AC(s32, s16 *);                  /* extern */
s32 func_8000CA20(s32, s32 *);                  /* extern */
s32 func_8000CB78(s32, s32, s32);       /* extern */
s32 func_8000CE10(s32, s32, s32);       /* extern */
s32 func_8000D2C0(s32 *);                   /* extern */
s32 func_8000D5BC(s32, s32, s32);       /* extern */
void *func_8000D740(s32, s32, u16 *);           /* extern */
s32 func_8000F31C();                            /* extern */
s32 func_80016E80(s32, s32 *, s32); /* extern */
s32 func_80016FC4(s32);                         /* extern */
s16 func_80016FD4();                                /* extern */
s32 func_80021EE0(s32);                     /* extern */
s32 func_80025AB8();                            /* extern */
s32 func_8002FC68();                            /* extern */
s32 func_8002FE58();                            /* extern */
s32 func_8003190C(s32);                     /* extern */
u16 func_80031A1C(s32);                         /* extern */
s32 func_80033484();                            /* extern */
s32 func_800334B8();                       /* extern */
s32 func_80033AA8(s32, s32 *);              /* extern */
s32 func_80033B10(s32);                         /* extern */
u16 func_800356C4(s32 *, s32);              /* extern */
s32 func_80035A7C(s32);                         /* extern */
s32 func_80036D28();                            /* extern */
s32 func_80036D30();                            /* extern */
s32 func_800373B4(s32);                     /* extern */
s32 func_80039428();                            /* extern */
s32 func_8003C8E0(s32 *, s32, s32, s32); /* extern */
s32 func_8003CB98(s32);                     /* extern */
s16 func_8003CBB8();                                /* extern */
s32 func_8003D158(s32);                     /* extern */
s32 func_8003D2D4(s32, s32);            /* extern */
s32 func_8003DBB0(u8);                          /* extern */
s32 func_8003DDA4();                                /* extern */
s32 func_80041640(s32, s32);            /* extern */
s32 func_80041670();                            /* extern */
s32 func_800417C0();                            /* extern */
s32 func_80042094();                            /* extern */
s32 func_800448D8(u16, s32, s16 *, u16 *);  /* extern */
s32 func_80094328();                            /* extern */
s32 func_800944BC();                            /* extern */
s32 func_80094C08();                            /* extern */
s32 func_80095024();                            /* extern */
s32 func_80096758(s32);                     /* extern */
s32 func_80097194(s32, s32);                /* extern */
s32 func_8009B2C4(s32);                         /* extern */
s32 func_8009BC40();                            /* extern */
s32 func_800A2C98();                            /* extern */
s32 func_800B1E98();                            /* extern */
s32 func_800B9578(s32);                     /* extern */
s32 func_800BC038(s32);                         /* extern */
void func_800BEE28();        /* extern */
s32 func_800BF044();                            /* extern */
s32 func_800BF278(u16);                         /* extern */
s32 func_800BF6E8(s32);                         /* extern */
s32 func_800BF6F0(s32, s32);                /* extern */
s32 func_800C16A0(void *, s32);             /* extern */
s32 func_800C6028(s32, s16 *);                  /* extern */
s32 func_800C6130(s32, s32 *);              /* extern */
s32 func_800CC18C();                            /* extern */
s32 func_800E0B58();                            /* extern */
s32 func_800E573C();                            /* extern */
extern s32 D_8000040C;
extern s32 D_80000410;
extern s32 D_8000041C;
extern s32 D_80000424;
extern s32 D_80000428;
extern s16 D_80064A4C;
extern u16 D_80064A4E;
extern u16 D_80064A50;
extern s32 D_80069890;
extern s32 D_80069A30;
extern s32 D_80069AE8;
extern s32 D_80069C7C;
extern s32 D_8006AAD8;
extern s32 D_80072DF0;
extern u16 D_8007AB30;
extern s32 D_8007AB34;
extern s16 D_8007AB40;
extern s32 D_80080C10;
extern u8 D_80080C90;
extern u16 D_80082DD8;
extern u8 D_80082DDC;
extern u16 D_80084F24;
extern s32 D_80084F30;
extern s32 D_80084F34;
extern u8 *D_80085040[];
extern u8 *D_80085098[];
extern s32 D_80085298;
extern s16 D_800857F0;
extern s32 *D_80085A30;
extern s32 D_80086C88;
extern s32 *D_80086DD8;
extern s16 D_8008712E;
extern s16 D_800876DC;
extern s32 *D_80087894;
extern s16 D_80087994;
extern s32 D_80087A64;
extern s16 D_80087A68;
extern s8 D_80087A6A;
extern s16 D_80087A92;
extern s32 D_80087AA4;
extern s32 D_80087AA8;
extern s8 D_80087AF2;
extern s32 D_80088090;
extern s32 *D_80088094;
extern s32 D_800880F0[];
extern s32 D_80088630;
extern s16 D_800886E0;
extern u16 D_800886FC;
extern s16 D_80088AE4;
extern s16 D_800892A0;
extern u16 D_800892B4;
extern u16 D_800892B6;
extern void *D_800892C0;
extern s16 D_800892C8;
extern void *D_80089300;
extern s16 D_80089320;
extern s32 D_80089490[];
extern s32 D_80089494;
extern s32 D_80089498;
extern s16 D_800894FC;
extern s8 D_80089514;
extern s8 D_8008951A;
extern s16 D_80089598;
extern s16 D_8008959A;
extern s32 D_8008A3DC;
extern void *D_8008A3E8[4];
extern s8 D_8008AFC6;
extern s32 *D_8008B374;
extern s32 D_8008B3D0;
extern u16 D_8008B672;
extern s32 D_800C2EC8;
extern s32 D_800C4368;
extern s32 D_800E5974;

typedef struct {
    u16 id;
    s16 x;
    s16 y;
    u8 flag;
    u8 mode;
} SpriteParams;

typedef struct {
    s16 kind;
    s16 value;
} MenuParams;

extern SpriteParams D_80069BD4;
extern SpriteParams D_80069BDC;
extern SpriteParams D_80069BE4;
extern s16 D_80069BD6;
extern s16 D_80069BD8;
extern u8 D_80069BE2;
extern s16 D_80069BDE;
extern s16 D_80069BE0;
extern u8 D_80069BE3;
extern u8 D_80069BEB;
extern MenuParams D_800850F0;

typedef union {
    s16 v[12];
    s32 w[6];
} Formation;

typedef struct {
    s16 a;
    s16 b;
    Formation f;
    s16 d;
} TeamSetup;

extern TeamSetup D_80082D94;
extern TeamSetup D_80084EE0;

void func_800E6290(void) {
    u16 i;
    s16 pos[3];
    s32 vel[3];
    s16 rect[4];
    s16 view[4];
    s16 temp_s0_3;
    s16 var_v0;
    s32 temp_a1;
    s32 temp_s0;
    s32 temp_v0;
    s32 temp_v0_2;
    s32 temp_v0_4;
    s32 var_a0;
    s32 var_a0_2;
    s32 var_v0_2;
    s32 var_v0_3;
    u16 temp_s0_2;
    u16 temp_v0_3;
    void **temp_v1;
    void **temp_v1_2;
    void *temp_v0_5;

    D_80086C88 = 0;
    D_8007AB40 = func_8003CBB8();
    func_8003CB98(7);
    func_800E573C();
    D_80087A92 = 0x25;
    D_80087894 = &D_800C2EC8;
    D_80085A30 = &D_800C4368;
    D_80088094 = &D_80072DF0;
    D_8008B374 = &D_8006AAD8;
    func_8002FC68();
    func_80036D28();
    func_80041640(0, 0);
    func_8002FE58();
    func_8000D2C0(&D_80069890);
    D_80087A64 = func_8000D5BC(0, 0, 0);
    D_80087AA8 = func_8000D5BC(0, 0, 0);
    func_8000B2E0(&D_80069A30);
    temp_v0 = func_8000B6F8(4, 0xB);
    D_80088090 = temp_v0;
    func_80033B10(temp_v0);
    func_8000C940(D_80088090, 0, 0);
    func_8000C964(D_80088090, 0x140, 0xF0);
    pos[0] = 0x590;
    pos[2] = 0;
    pos[1] = 0;
    vel[1] = 0;
    vel[0] = 0;
    vel[2] = 0xA70000;
    func_8000C9AC(D_80088090, pos);
    func_8000CA20(D_80088090, vel);
    temp_v0_2 = func_8000B6F8(0xA, 4);
    D_80087AA4 = temp_v0_2;
    func_8000C940(temp_v0_2, 0, 0);
    func_8000C964(D_80087AA4, 0x140, 0xF0);
    func_8000C8AC(D_80087AA4);
    func_8000C898(D_80088090, D_80087A64);
    func_8000C898(D_80087AA4, D_80087AA8);
    func_800A2C98();
    func_80016E80(0, &D_80000424, 0x258);
    D_80087994 = func_80016FD4();
    func_800334B8();
    func_8003C8E0(&D_8000041C, 0xB1C, 0x42, 1);
    func_80042094();
    func_8003D158(2);
    func_80041670();
    func_800334B8();
    D_800886FC = func_800356C4(&D_80000410, 0x2B8);
    func_800BF044();
    func_800334B8();
    func_80096758(0x12);
    func_800B9578(0x21);
    temp_v0_3 = func_800356C4(&D_8000040C, 0xBF4);
    D_8007AB30 = temp_v0_3;
    func_80097194(temp_v0_3 & 0xFFFF, 4);
    func_800BF278(D_8007AB30);
    temp_s0 = M2C_FIELD((s8 *)&D_80073523 + ((func_8003DDA4() & 0xFFFF) * 0x10), u8 *, 0) & 1;
    func_80094C08();
    func_800334B8();
    D_800892C0 = NULL;
    if (temp_s0 & 0xFFFF) {
        D_80069BD4.id = D_800886FC;
        switch (D_80087A68) {
        case 1:
            D_80069BD6 = 0x15;
            D_80069BD8 = 0x16;
            break;
        case 3:
            D_80069BD6 = 0x19;
            D_80069BD8 = 0x1A;
            break;
        case 2:
            D_80069BD6 = 0x17;
            D_80069BD8 = 0x18;
            D_80069BD6 = 0x19;
            D_80069BD8 = 0x1A;
            break;
        case 4:
            D_80069BD6 = 0x1B;
            D_80069BD8 = 0x1C;
            D_80069BD6 = 0x15;
            D_80069BD8 = 0x16;
            break;
        default:
            D_80069BD6 = 0x13;
            D_80069BD8 = 0x14;
            break;
        }
        if (D_80087A92 == 0x28) {
            D_80069BD6 = 0x15;
            D_80069BD8 = 0x16;
        }
        D_800892C0 = func_8000D740(D_80087A64, 0xD, &D_80069BD4);
        func_800334B8();
    }
    if (!(M2C_FIELD((s8 *)&D_80073523 + ((func_8003DDA4() & 0xFFFF) * 0x10), u8 *, 0) & 4)) {
        D_80064A4C = func_80031A1C(0xFFF) & 0xE00;
        D_80064A4E = func_80031A1C(0x180);
        i = 0;
    } else {
        D_80064A4E = 0;
        i = 0;
    }
    do {
        D_8008A3E8[i] = NULL;
        i++;
    } while (i < 4);
    switch (D_80087A68) {                           /* switch 2; irregular */
    case 1:                                         /* switch 2 */
        if (!(M2C_FIELD((s8 *)&D_80073523 + ((func_8003DDA4() & 0xFFFF) * 0x10), u8 *, 0) & 8)) {
            D_80069BE2 = 1;
            D_80069BDE = 0x1D;
            D_80069BE0 = 0x1E;
            D_80069BDC.id = D_800886FC;
            temp_s0_2 = func_80031A1C(4);
            D_80069BE3 = temp_s0_2 + (s16)(func_80031A1C(4) + 8);
            D_8008A3E8[0] = func_8000D740(D_80087A64, 0xD, &D_80069BDC);
            D_80069BE3 = 5;
            D_80069BE2 = 0x81;
        }
        break;
    case 3:                                         /* switch 2 */
        if (!(M2C_FIELD((s8 *)&D_80073523 + ((func_8003DDA4() & 0xFFFF) * 0x10), u8 *, 0) & 8)) {
            D_80069BEB = 4;
            D_80069BE4.id = D_800886FC;
            D_8008A3E8[0] = func_8000D740(D_80087A64, 0xD, &D_80069BE4);
        }
        break;
    case 2:                                         /* switch 2 */
        if (!(M2C_FIELD((s8 *)&D_80073523 + ((func_8003DDA4() & 0xFFFF) * 0x10), u8 *, 0) & 4)) {
            D_80064A4E = func_80031A1C(0x100) + 0x200;
        }
        break;
    default:                                        /* switch 2 */
        D_8008A3E8[0] = NULL;
        break;
    }
    func_8000C930(&D_8008B3D0, 0, 0, 0);
    func_800334B8();
    D_80080C90 = (u8) D_800892B6;
    temp_v0_4 = D_800892B6 & 0xFF;
    D_80082DDC = (u8) D_800892B4;
    switch (temp_v0_4) {                            /* switch 3 */
    case 0x6:                                       /* switch 3 */
    case 0x1D:                                      /* switch 3 */
    case 0x36:                                      /* switch 3 */
    case 0x3F:                                      /* switch 3 */
    case 0x41:                                      /* switch 3 */
    case 0x4F:                                      /* switch 3 */
    case 0x5D:                                      /* switch 3 */
    case 0x67:                                      /* switch 3 */
    case 0x68:                                      /* switch 3 */
    case 0x69:                                      /* switch 3 */
    case 0x6E:                                      /* switch 3 */
    case 0x74:                                      /* switch 3 */
    case 0x75:                                      /* switch 3 */
        D_80082DD8 = 1;
        D_80084F24 = 0;
        break;
    default:                                        /* switch 3 */
        D_80082DD8 = 0;
        D_80084F24 = 1;
        break;
    }
    D_80087AF2 = 0;
    temp_s0_3 = func_80016FD4();
    func_80016FC4(func_800356C4(&D_80000428, 0xF78) & 0xFFFF);
    func_80039428();
    func_800334B8();
    func_800944BC();
    func_80035A7C(func_80016FD4() & 0xFFFF);
    func_80016FC4(temp_s0_3 & 0xFFFF);
    func_800334B8();
    func_8000F31C();
    D_800850F0.value = 0xDC;
    func_800C6028(D_80087A64, &D_800850F0);
    rect[2] = 0x86;
    rect[3] = 0x86;
    view[2] = 0;
    view[3] = 1;
    rect[0] = D_80080C90;
    rect[1] = (s16) D_80082DDC;
    view[0] = D_80082DD8;
    view[1] = D_80084F24;
    func_800448D8(D_8007AB30, 1, rect, view);
    func_800334B8();
    D_80088630 = func_80033AA8(0, &D_80069C7C);
    func_80095024();
    func_8003DBB0(M2C_FIELD((s8 *)&D_80073524 + ((func_8003DDA4() & 0xFFFF) * 0x10), u8 *, 0));
    temp_v0_5 = func_8000D740(D_80087A64, 3, NULL);
    temp_a1 = M2C_FIELD(temp_v0_5, s32 *, 8);
    D_80089300 = temp_v0_5;
    D_80085298 = temp_a1;
    func_800BF6F0(0x16, temp_a1);
    func_800334B8();
    func_8009B2C4(D_80085298);
    func_800C6130(D_80087A64, &D_80069AE8);
    func_80094328();
    func_800334B8();
    func_800BC038(D_80087A64);
    D_80089494 = 1;
    D_80089490[0] = 0;
    D_80089498 = -1;
    D_80089598 = 0;
    D_8008959A = 1;
    D_80087A6A = 0;
    i = 0;
    while (i < (u16)D_8008B672 >> 1) {
        M2C_FIELD(M2C_FIELD(D_80085040[i], void **, 0x24), s32 *, 0x1C) = 0xFE700000;
        M2C_FIELD(M2C_FIELD(D_80085040[i], void **, 0x24), s32 *, 0x20) = i * 0x300000;
        func_800C16A0(D_80085040[i], 0x3FF);
        i++;
    }
    i = 0;
    while (i < (u16)D_8008B672 >> 1) {
        M2C_FIELD(M2C_FIELD(D_80085098[i], void **, 0x24), s32 *, 0x1C) = 0x01900000;
        M2C_FIELD(M2C_FIELD(D_80085098[i], void **, 0x24), s32 *, 0x20) = -(i * 0x300000);
        func_800C16A0(D_80085098[i], 0xBFF);
        i++;
    }
    func_800373B4(0);
    func_800373B4(1);
    func_80021EE0(0);
    func_80021EE0(1);
    i = 0;
    func_80025AB8();
    func_800BF6E8(D_80085298);
    D_80082D94.b = 3;
    D_80084EE0.b = 3;
    D_80082D94.f.v[6] = 3;
    D_80082D94.f.v[0] = 0x24;
    D_80082D94.f.v[8] = 0x11;
    D_80082D94.f.v[2] = 0x38;
    D_80082D94.f.v[10] = 0x12;
    D_80082D94.f.v[4] = 0x3C;
    D_80082D94.f.v[1] = 6;
    D_80082D94.f.v[3] = 7;
    D_80082D94.a = 0;
    D_80084EE0.a = 0;
    D_80082D94.d = 0;
    D_80084EE0.d = 0;
    D_80082D94.f.v[7] = 0;
    D_80082D94.f.v[9] = 0;
    D_80082D94.f.v[11] = 0;
    D_80082D94.f.v[5] = 4;
    D_80084EE0.f = D_80082D94.f;
    D_80089320 = -1;
    D_800876DC = 1;
    D_80089514 = 0;
    do {
        D_800880F0[i] = 0;
        i++;
    } while (i < 8);
    D_800886E0 = 1;
    D_8008A3DC = 0;
    D_80084F30 = 0;
    D_80084F34 = 0;
    D_800892C8 = 0;
    D_800894FC = 0;
    D_800892A0 = 0;
    D_800857F0 = 0;
    D_80088AE4 = 0;
    D_80080C10 = 0x10000;
    i = 0;
    func_800BEE28();
    func_8009BC40();
    func_800CC18C();
    while (D_80089490[i] != -1) {
        i++;
    }
    if ((i & 0xFFFF) != 1) {
        D_8008AFC6 = 0;
        D_8008951A = 0;
    }
    M2C_FIELD((s8 *)&D_80086DDC + (D_80088AE4), s8 *, 0) = 2;
    M2C_FIELD((s8 *)&D_80086DDC + (D_800886E0), s8 *, 0) = 2;
    func_800334B8();
    func_8000CB78(D_80088090, 0, 0);
    func_800417C0();
    func_8003190C(0x1000);
    func_800E0B58();
    func_800334B8();
    func_800334B8();
    func_80036D30();
    D_8008712E = 0;
    D_80064A50 = D_80064A4E;
    func_80033484();
    func_8000BE80();
    func_800B1E98();
    D_8007AB34 = 0;
    D_80086DD8 = &D_800E5974;
    func_8000C8BC(D_80088090);
    func_8000BF08();
    func_8000BF08();
    func_8000CE10(D_80088090, 1, 4);
    func_8003D2D4(0x41, 0);
}
