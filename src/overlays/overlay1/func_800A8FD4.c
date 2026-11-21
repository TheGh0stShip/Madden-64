#include "types.h"

typedef struct {
    u8 pad00[0x1C];
    s32 unk_1C;
    s32 unk_20;
} Model;

typedef struct {
    u8 pad00[0xA];
    s16 unk_0A;
    Model *unk_0C;
    u8 pad10[4];
    s32 unk_14;
    s32 unk_18;
    u8 pad1C[0x30];
    s16 unk_4C;
    s16 unk_4E;
    s16 unk_50;
    u8 pad52[2];
    s16 unk_54;
    s16 unk_56;
    s16 unk_58;
    u8 pad5A[0x1A];
    s16 unk_74;
    s16 unk_76;
    s16 unk_78;
    u8 pad7A[2];
    s16 unk_7C;
    s16 unk_7E;
    s16 unk_80;
    u8 pad82[0x1E];
    s32 unk_A0;
    u8 padA4[0xC];
    s32 unk_B0;
    s32 unk_B4;
    s32 unk_B8;
    s32 unk_BC;
} Obj;

typedef struct {
    s32 a;
    s32 b;
    s32 c;
} Anim;

typedef struct {
    s16 a;
    s16 b;
    s16 c;
} Pose;

extern s32 D_80089490[];
extern s16 D_80089598[];
extern s16 D_80088AE4;
extern u16 D_8008A5B2;
void func_800A4790(Obj *);
void func_800A6590(Obj *, s32);
s32 func_8000C8EC(s32);
void func_800A6A70(Obj *, s32, s32);
void func_800A2E58(Obj *, Anim *);
void func_800A2EB4(Obj *, Pose *);

void func_800A48B0(Obj *obj) {
    Anim anim;
    Pose pose;
    s16 sel;
    s16 i;
    s16 v;

    sel = -1;
    for (i = 0; D_80089490[i] != -1; i++) {
        v = D_80089598[D_80089490[i]];
        if (v != sel) {
            if (sel == -1) {
                sel = v;
            } else {
                sel = 2;
            }
        }
    }
    obj->unk_B0 = 0xFE400000;
    obj->unk_B4 = 0x01C00000;
    obj->unk_B8 = 0xFB100000;
    obj->unk_BC = 0x04F00000;
    if (sel == -1 || sel == D_80088AE4) {
        func_800A4790(obj);
    } else if (sel == 2) {
        func_800A6590(obj, 1);
    } else {
        obj->unk_4C = 4;
        obj->unk_4E = 4;
        obj->unk_50 = 4;
        obj->unk_54 = 7;
        obj->unk_56 = 7;
        obj->unk_58 = 7;
        obj->unk_74 = 4;
        obj->unk_76 = 4;
        obj->unk_78 = 4;
        obj->unk_7C = 5;
        obj->unk_7E = 5;
        obj->unk_80 = 5;
        if (func_8000C8EC(obj->unk_14)) {
            pose.c = 0;
        } else {
            pose.c = 0x7FF;
        }
        if (obj->unk_0A == 3 || D_8008A5B2 == 3) {
            obj->unk_4C = 0;
            obj->unk_4E = 0;
            obj->unk_50 = 0;
            obj->unk_54 = 0;
            obj->unk_56 = 0;
            obj->unk_58 = 0;
        } else if (obj->unk_0A == 6) {
            func_800A6A70(obj, 0xEE, 0x11);
            pose.c += obj->unk_A0;
        }
        pose.a = 0x5A0;
        pose.b = 0;
        anim.a = obj->unk_0C->unk_1C;
        anim.c = 0xD20000;
        obj->unk_18 = 0x1000000;
        anim.b = obj->unk_0C->unk_20 + 0x1000000;
        func_800A2E58(obj, &anim);
        func_800A2EB4(obj, &pose);
    }
}
