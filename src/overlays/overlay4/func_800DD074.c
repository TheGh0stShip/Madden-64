#include "types.h"

typedef struct { u8 a, b, c, d; } Msg;
typedef struct { s32 x; s32 y; } Pos2;
typedef struct { s32 x; s32 y; s32 z; s32 w; } Vec4i;
typedef struct { s16 x; s16 y; } Spot;
typedef struct { Spot pos[1]; } SpotTbl;
typedef struct { s16 x; s16 y; s16 pad[4]; } Spot6;
typedef struct { Spot6 pos[1]; } Spot6Tbl;
typedef struct { u8 pad[0x1C]; s32 unk1C; s32 unk20; u8 pad24[8]; s32 unk2C; s32 unk30; } Sub;
typedef struct Obj {
    u8 pad0[0x1E];
    u8 unk1E;
    u8 unk1F;
    u8 pad20[4];
    Sub *unk24;
    u16 unk28;
    u8 pad2A[0x65 - 0x2A];
    u8 unk65;
    u8 unk66;
} Obj;
typedef struct { Obj *p[22]; } Team;
typedef struct { u8 pad[0x20]; SpotTbl *unk20; } Formation;
typedef struct { Formation *unk0; u8 pad[0x214C - 4]; } PlayA;
typedef struct { Spot6Tbl *unk0; u8 pad[0x214C - 4]; } PlayB;
typedef struct { s16 unk0; u8 pad[0x214C - 2]; } PlayC;

extern s32 func_800DB554(Obj *, Vec4i *);
extern s32 func_800DB6D0(void);
extern s32 func_800DB738(void);
extern void func_800DB7A0(Obj *, s32);
extern s32 func_800DEC38(void);
extern s16 func_800C1608(Obj *);
extern s32 func_800E1BCC(Obj *, Msg *);
extern PlayA D_80082DB4[];
extern PlayB D_80082DB8[];
extern PlayC D_80082DC0[];
extern Pos2 D_80084F30;
extern Obj *D_80085040[][22];
extern s8 D_80086DDC[];
extern s8 D_800876B8;
extern s8 D_800884A3[];
extern s16 D_800886E0;
extern s16 D_80088AE4;
extern s8 D_8008B618;

s32 func_800DD074(Obj *arg0) {
    Vec4i v;
    Msg m;
    s32 dx;
    s32 flip;
    s32 near;
    s32 pos;
    s16 state;

    dx = 0;
    flip = 0;
    near = 0;
    if (!(arg0->unk28 & 1)) {
        pos = arg0->unk1F;
        if ((arg0->unk66 == 1 || arg0->unk66 == 5) && D_80086DDC[D_80088AE4] == 1) {
            dx = D_80085040[arg0->unk1E ^ 1][D_800884A3[arg0->unk66]]->unk24->unk1C - arg0->unk24->unk1C;
        }
        if (D_8008B618 == 1) {
            if (D_80082DC0[D_800886E0].unk0 == 0x10) {
                if (pos == 5) {
                    pos = 6;
                    flip = 1;
                } else if (pos == 6) {
                    pos = 5;
                    flip = 1;
                }
            }
            if (D_80082DC0[D_800886E0].unk0 == 3) {
                switch (pos) {
                case 3:
                    pos = 2;
                    flip = 1;
                    break;
                case 2:
                    pos = 3;
                    flip = 1;
                    break;
                case 5:
                    pos = 6;
                    flip = 1;
                    break;
                case 6:
                    pos = 5;
                    flip = 1;
                    break;
                }
            }
        }
        if ((u32)(func_800DEC38() - 3) < 2) {
            state = D_80082DC0[D_800886E0].unk0;
            if (state == 0x10 || state == 3 || state == 0xF) {
                if (pos == 4 && func_800DB6D0() > (s32)0xFF8C0000) {
                    near = 1;
                }
                if (pos == 7 && func_800DB738() < 0x740000) {
                    near = 1;
                }
            }
        }
        switch (arg0->unk65) {
        case 0:
            if (D_80082DB4[D_800886E0].unk0->unk20 == 0) {
                return 1;
            }
            v.y = D_80082DB4[D_800886E0].unk0->unk20->pos[pos].y << 16;
            if (arg0->unk66 == 1 || arg0->unk66 == 5) {
                v.x = dx;
            } else {
                v.x = D_80082DB4[D_800886E0].unk0->unk20->pos[pos].x << 16;
                if (flip) {
                    v.x = -v.x;
                }
                if (near) {
                    if (pos == 7) {
                        v.y = 0x400000;
                        v.x = 0x9A0000;
                    }
                    if (pos == 4) {
                        v.y = 0x400000;
                        v.x = -0x9A0000;
                    }
                }
                v.x = D_80084F30.x + v.x - arg0->unk24->unk1C;
            }
            v.y = D_80084F30.y + v.y - arg0->unk24->unk20;
            if (func_800DB554(arg0, &v) == 1) {
                func_800DB7A0(arg0, 0xFF);
                return 1;
            }
            return 0;
        case 1:
            if (D_80082DB4[D_800886E0].unk0->unk20 == 0) {
                return 1;
            }
            if (arg0->unk66 == 1 || arg0->unk66 == 5) {
                v.x = dx;
            } else {
                v.x = D_80082DB8[D_800886E0].unk0->pos[pos].x << 16;
                if (flip) {
                    v.x = -v.x;
                }
                v.x = D_80084F30.x + v.x - arg0->unk24->unk1C;
            }
            v.y = D_80084F30.y + (D_80082DB8[D_800886E0].unk0->pos[pos].y << 16) - arg0->unk24->unk20;
            if (func_800DB554(arg0, &v) == 1) {
                func_800DB7A0(arg0, 0xFF);
                return 1;
            }
            return 0;
        default:
            if (arg0->unk66 == 1 || arg0->unk66 == 5) {
                v.x = dx;
                v.y = D_80084F30.y + (D_80082DB8[D_800886E0].unk0->pos[pos].y << 16) - arg0->unk24->unk20;
                if (func_800DB554(arg0, &v) != 1) {
                    return 0;
                }
            } else {
                if ((pos == 7 || pos == 4) && D_800876B8 == 1) {
                    if (near) {
                        if (pos == 7) {
                            v.y = 0x400000;
                            v.x = 0x9A0000;
                        }
                        if (pos == 4) {
                            v.y = 0x400000;
                            v.x = -0x9A0000;
                        }
                    } else {
                        v.y = D_80082DB4[D_800886E0].unk0->unk20->pos[pos].y << 16;
                        v.x = D_80082DB4[D_800886E0].unk0->unk20->pos[pos].x << 16;
                        if (flip) {
                            v.x = -v.x;
                        }
                    }
                    v.x = D_80084F30.x + v.x - arg0->unk24->unk1C;
                    v.y = D_80084F30.y + v.y - arg0->unk24->unk20;
                    if (func_800DB554(arg0, &v) != 1) {
                        return 0;
                    }
                }
                if (func_800C1608(arg0) >= 6 || func_800C1608(arg0) < 3) {
                    arg0->unk24->unk2C = arg0->unk24->unk30 = 0;
                    m.a = 4;
                    m.c = 0x1E;
                    m.b = 0;
                    m.d = 0x40;
                    func_800E1BCC(arg0, &m);
                }
            }
            return 1;
        }
    }
    if (arg0->unk65 < 2) {
        func_800DB7A0(arg0, 0xFF);
    }
    return 1;
}
