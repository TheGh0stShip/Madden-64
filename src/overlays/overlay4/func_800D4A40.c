#include "types.h"

typedef struct {
    u8 unk_00[0x14];
    s32 unk_14;
} Sub;

typedef struct {
    u8 unk_00[0x24];
    Sub *unk_24;
    u16 unk_28;
    u8 unk_2A[3];
    u8 unk_2D;
    u8 unk_2E[6];
    s16 unk_34;
    s16 unk_36;
    u8 unk_38[0x2E];
    u8 unk_66;
    u8 unk_67[0x25];
    s32 unk_8C;
} Obj;

typedef struct {
    u8 unk_00[0x34];
    s32 unk_34;
} Game;

extern volatile u16 D_8008A5B4;
extern Game *D_80086178;
extern u8 D_80074824[];

s16 func_800C157C(Obj *);
void func_800C058C(Obj *, s16, s16, s32);
void func_800B96C0(Sub *, u8 *);
void func_800E1A84(Obj *, u8 *);

s32 func_800D31A0(Obj *obj) {
    s16 flag;
    s16 angle;
    u8 buf[8];
    void *p;
    u8 t;

    flag = 0;
    if (obj->unk_66 == 0) {
        s32 bits = obj->unk_24->unk_14 & 0x20000;
        bits = bits == 0;
        flag = bits;
    } else {
        obj->unk_8C += D_8008A5B4;
        if (obj->unk_8C >= 0x1F) {
            flag = 1;
            obj->unk_24->unk_14 &= ~0x20000;
        }
        if (!(obj->unk_24->unk_14 & 0x20000)) {
            flag = 1;
        }
    }
    if (!(obj->unk_28 & 1)) {
        if (D_80086178->unk_34 > 0) {
            flag = 1;
        }
    }
    if (obj->unk_66 == 1) {
        angle = func_800C157C(obj);
        func_800C058C(obj, angle, angle, 0x9999);
    }
    if (flag != 1) {
        return 0;
    }
    obj->unk_34 = 0x25;
    obj->unk_36 = 8;
    func_800B96C0(obj->unk_24, D_80074824);
    t = obj->unk_2D - 0x1D;
    p = obj;
    if (t < 2) {
        buf[0] = 6;
        func_800E1A84(p, buf);
    } else {
        obj->unk_28 &= ~0x10;
        p = obj->unk_24;
        ((Sub *)p)->unk_14 &= ~0x10000;
    }
    return 1;
}
