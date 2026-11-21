#include "types.h"

typedef struct Vec {
    s32 x;
    s32 y;
    s32 z;
    s32 pad;
} Vec;

typedef struct Model {
    u8 pad0[0x12];
    s16 unk_12;
} Model;

typedef struct Sub {
    u8 pad0[0x8];
    Model *unk_08;
    u8 padC[0x8];
    s32 unk_14;
    u8 pad18[0x4];
    s32 unk_1C;
    s32 unk_20;
    s32 unk_24;
    s32 unk_28;
    s32 unk_2C;
    s32 unk_30;
    s32 unk_34;
} Sub;

typedef struct Obj {
    u8 pad0[0x24];
    Sub *sub;
    u8 pad28[0x8];
    s16 unk_30;
    u8 pad32[0x5A];
    s32 unk_8C;
    s32 unk_90;
} Obj;

typedef struct Coach {
    u8 pad0[0x24];
    Sub *sub;
    u8 pad28[0x88];
} Coach;

extern u8 D_800717F8;
extern u16 D_80080C14;
extern Sub *D_80086178;
extern u8 D_80086CE8[];
typedef struct Pair {
    s32 x;
    s32 y;
} Pair;
extern Pair D_80086D14;
extern u32 D_80086D8C;
typedef struct Rot {
    s16 x;
    s16 y;
    s16 z;
} Rot;
extern Rot D_80086E28;
extern Coach D_80087138[];
extern u16 D_8008799C;
extern s16 D_800894FC;
extern u16 D_8008A5B2;
extern u16 D_8008A71C;
extern u16 D_8008AFD4;

extern void func_8000BEE8(s32 value);
extern void func_8000EC8C(Sub *object, s16 *values);
extern void func_8002CAD0(void);
extern void func_8002CD28(void);
extern void func_8002CD44(s32 value);
extern void func_8002D14C(s32 value);
s32 func_8009EDB0();
s32 func_800A365C(s32);
s16 func_800B9208(Vec *);
s32 func_800C0018(void *, s16, s32);
extern void func_800C16A0(Obj *owner, s16 value);
extern void func_800C62A8(Coach *);
extern void func_800C67CC(s32, s32);
extern void func_800C70C4(Vec *, s32);
extern void func_800C6330(s32);
u16 func_800E0E24(void);
extern void func_800E0E44(Sub *, Vec *, s16 *);
extern void func_800E0E90(Model *, Vec *, s32 *);
extern void func_800E0F7C(u8 *);
extern void func_800E1BCC(Coach *object, u8 *command);

s32 func_800D24F4(Obj *obj) {
    Vec pos;
    Vec vel;
    s16 rot[4];
    u8 command[8];
    Vec diff;
    s32 min;
    s32 i;
    s32 best;

    obj->unk_30 = 0;
    if (func_800E0E24()) {
        D_800894FC = 0x1E;
    } else {
        D_8008A71C &= 0xFFFD;
        if (D_800717F8 == 0) {
            D_80086D8C = 4;
        }
        switch (D_80086D8C) {
        case 0:
            return 0;
        case 1:
            D_80086D8C = 2;
        case 2:
        case 3:
            D_800894FC = 0x1E;
            return 0;
        case 4:
            func_800E0F7C(D_80086CE8);
            func_8000BEE8(1);
            D_80086D8C = 0;
        default:
            func_800A365C(0);
            best = 0;
            if (D_8008799C == 4) {
                min = 0x7FFFFFFF;
                for (i = 0; (u16)i < 4; i++) {
                    s32 dx, dz, dist;
                    diff.x = D_80087138[(u16)i].sub->unk_1C - D_80086178->unk_1C;
                    diff.y = D_80087138[(u16)i].sub->unk_20 - D_80086178->unk_20;
                    dx = diff.x;
                    if (dx < 0) {
                        dx = -dx;
                    }
                    dz = diff.y;
                    if (dz < 0) {
                        dz = -dz;
                    }
                    if (dx < dz) {
                        dist = dz + dx / 2;
                    } else {
                        dist = dx + dz / 2;
                    }
                    if (dist < min) {
                        min = dist;
                        best = i;
                    }
                }
                D_8008A5B2 = 0;
                D_80080C14 = 0;
                D_80086178->unk_24 = 0;
                D_80086178->unk_2C = 0;
                D_80086178->unk_30 = 0;
                D_80086178->unk_34 = 0;
                D_80086E28.x = 0;
                D_80086E28.y = 0;
                D_80086E28.z = 0;
                command[0] = 0x36;
                func_800C62A8(&D_80087138[(u16)best]);
                func_800E1BCC(&D_80087138[(u16)best], command);
                return 1;
            }
            func_8009EDB0();
            return 1;
        }
    }
    if (obj->sub->unk_14 & 0x100000) {
        s32 dx, dz, dist;
        pos.x = obj->unk_8C - obj->sub->unk_1C;
        pos.y = obj->unk_90 - obj->sub->unk_20;
        D_80086D14.x = obj->sub->unk_1C;
        D_80086D14.y = obj->sub->unk_20;
        dx = pos.x;
        dz = pos.y;
        if (dx < 0) {
            dx = -dx;
        }
        if (dz < 0) {
            dz = -dz;
        }
        if (dx < dz) {
            dist = dz + dx / 2;
        } else {
            dist = dx + dz / 2;
        }
        if (dist < 0x180000) {
            obj->sub->unk_2C = 0;
            obj->sub->unk_30 = 0;
            func_800C16A0(obj, func_800B9208(&pos));
            obj->sub->unk_14 &= ~0x100000;
            return 0;
        }
        func_800C0018(obj, func_800B9208(&pos), 0);
    }
    if (obj->sub->unk_14 & 0x40000) {
        func_8002CAD0();
        func_8002CD44(0x400);
        func_8002D14C(obj->sub->unk_08->unk_12);
        obj->sub->unk_14 &= ~0x40000;
        if (D_8008799C == 1) {
            func_800E0E44(obj->sub, &pos, rot);
            D_80086178->unk_1C = obj->sub->unk_1C + pos.x;
            D_80086178->unk_20 = obj->sub->unk_20 + pos.y;
            D_80086178->unk_24 = obj->sub->unk_24 + pos.z;
            func_8000EC8C(D_80086178, rot);
            func_800C6330(0);
            D_80086178->unk_2C = 0;
            D_80086178->unk_30 = 0;
            D_80086178->unk_34 = 0;
        } else if (D_8008799C == 2) {
            D_80086178->unk_1C = obj->sub->unk_1C;
            D_80086178->unk_20 = obj->sub->unk_20;
            D_80086178->unk_24 = 0x400000;
            pos.x = -0x100000;
            pos.y = 0x400000;
            func_800C6330(0);
            func_800C70C4(&pos, 5);
        } else if (D_8008799C == 3) {
            func_800E0E44(obj->sub, &pos, rot);
            D_80086178->unk_1C = obj->sub->unk_1C + pos.x;
            D_80086178->unk_20 = obj->sub->unk_20 + pos.y;
            D_80086178->unk_24 = obj->sub->unk_24 + pos.z;
            func_8000EC8C(D_80086178, rot);
            vel.x = 0x10000;
            vel.y = -0x19999;
            vel.z = -0xC0000;
            func_800C6330(0);
            func_800C67CC(0x66, 0);
            func_800E0E90(obj->sub->unk_08, &vel, &D_80086178->unk_2C);
        } else if (D_8008799C == 4) {
            func_800E0E44(obj->sub, &pos, rot);
            D_80086178->unk_1C = obj->sub->unk_1C + pos.x;
            D_80086178->unk_20 = obj->sub->unk_20 + pos.y;
            D_80086178->unk_24 = obj->sub->unk_24 + pos.z;
            func_8000EC8C(D_80086178, rot);
            func_800C6330(0);
            func_800C67CC(0x66, 0);
            pos.x = -0x60000;
            pos.y = 0;
            pos.z = 0x2AAAA;
            func_800E0E90(obj->sub->unk_08, &pos, &D_80086178->unk_2C);
        } else if (D_8008799C == 5) {
        } else if (D_8008799C == 6) {
            func_800E0E44(obj->sub, &pos, rot);
            D_80086178->unk_1C = obj->sub->unk_1C + pos.x;
            D_80086178->unk_20 = obj->sub->unk_20 + pos.y;
            D_80086178->unk_24 = obj->sub->unk_24 + pos.z;
            func_8000EC8C(D_80086178, rot);
            vel.x = 0x40000;
            if (D_8008AFD4 != 0) {
                vel.x = -0x40000;
            }
            vel.y = 0x20000;
            vel.z = -0xC0000;
            func_800C6330(0);
            func_800C67CC(0x66, 0);
            func_800E0E90(obj->sub->unk_08, &vel, &D_80086178->unk_2C);
        } else {
            D_80086178->unk_1C = obj->sub->unk_1C;
            D_80086178->unk_20 = obj->sub->unk_20;
            D_80086178->unk_24 = 0x80000;
            D_80086178->unk_2C = 0;
            D_80086178->unk_30 = 0;
            D_80086178->unk_34 = 0x400;
            func_800C6330(0);
        }
        func_8002CD28();
    }
    return 0;
}
