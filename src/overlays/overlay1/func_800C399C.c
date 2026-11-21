#include "types.h"

typedef struct {
    u8 pad00[0x16];
    s16 unk_16;
} ObjModel;

typedef struct {
    u8 pad00[0xC];
    void *unk_0C;
    u8 pad10[4];
    u32 unk_14;
    u8 pad18[4];
    s32 unk_1C;
    s32 unk_20;
    s32 unk_24;
    u8 pad28[4];
    s32 unk_2C;
    s32 unk_30;
    s32 unk_34;
    u8 pad38[4];
    s16 unk_3C;
    s16 unk_3E;
    u8 pad40[8];
    ObjModel *unk_48;
} Obj;

typedef struct {
    s16 unk_00;
    s16 unk_02;
    s16 unk_04;
    u8 pad06[0xA];
    Obj *unk_10;
} SpawnInfo;

typedef struct {
    s16 x;
    s16 y;
    s16 z;
} Vec3s;

extern SpawnInfo D_800850F0;
extern u8 D_80087A6A;
extern void *D_80087A64;
extern Obj *D_8008B620[2];
extern Obj *D_80088480;
extern s16 D_80073D94[];
extern u8 D_80073D7C[];
extern u8 D_80073D88[];
extern u8 D_80073D70[];
extern s32 D_80085E5C;

void func_8000F31C(void);
Obj *func_8000D740(void *, s32, SpawnInfo *);
void func_8000EB8C(Obj *);
void func_8000F324(Obj *, s32);
void func_8000EC58(Obj *);
void func_8000EC8C(Obj *, Vec3s *);
void linked_object_prepend(Obj *);
void record_slot_primary_set(Obj *, u8 *);
void record_slot_secondary_set(Obj *, u8 *);
void func_800BF644(void);

void func_800C399C(s16 arg0) {
    Vec3s vec;
    Obj *obj;
    u32 i;
    s32 x;

    D_800850F0.unk_00 = arg0;
    D_800850F0.unk_10 = 0;
    func_8000F31C();
    if (D_80087A6A == 1) {
        D_800850F0.unk_02 = 1;
    } else {
        D_800850F0.unk_02 = 0;
    }
    D_800850F0.unk_04 = 8;
    obj = func_8000D740(D_80087A64, 8, &D_800850F0);
    D_8008B620[0] = obj;
    func_8000EB8C(obj);
    func_8000F324(obj, 0x95);
    obj->unk_0C = func_800BF644;
    linked_object_prepend(D_8008B620[0]);
    func_8000EC58(obj);
    obj->unk_1C = 0;
    obj->unk_24 = 0;
    obj->unk_20 = 0x3EA0000;
    obj->unk_3C = 300;
    obj->unk_3E = 100;
    obj->unk_2C = 0;
    obj->unk_30 = 0;
    obj->unk_34 = 0;
    obj->unk_14 |= 0x201;
    obj->unk_48->unk_16 = 3;
    D_800850F0.unk_10 = obj;
    obj = func_8000D740(D_80087A64, 8, &D_800850F0);
    D_8008B620[1] = obj;
    func_8000F324(obj, 0x95);
    obj->unk_0C = func_800BF644;
    func_8000EB8C(obj);
    linked_object_prepend(D_8008B620[1]);
    func_8000EC58(obj);
    obj->unk_1C = 0;
    obj->unk_20 = 0xFC160000;
    obj->unk_24 = 0;
    obj->unk_3C = 300;
    obj->unk_3E = 100;
    obj->unk_2C = 0;
    obj->unk_30 = 0;
    obj->unk_34 = 0;
    obj->unk_14 |= 0x201;
    obj->unk_48->unk_16 = 3;
    vec.x = 0;
    vec.y = 0;
    vec.z = 0x800;
    func_8000EC8C(obj, &vec);
    func_8000F31C();
    D_800850F0.unk_10 = 0;
    D_800850F0.unk_02 = 3;
    D_800850F0.unk_04 = 0;
    obj = func_8000D740(D_80087A64, 8, &D_800850F0);
    D_80088480 = obj;
    func_8000EC58(obj);
    obj->unk_1C = 0x1B00000;
    obj->unk_20 = 0;
    obj->unk_24 = 0;
    obj->unk_0C = 0;
    vec.z = -0x400;
    func_8000EC8C(obj, &vec);
    func_8000F31C();
    D_800850F0.unk_02 = 2;
    for (i = 0; i < 8; i++) {
        obj = func_8000D740(D_80087A64, 8, &D_800850F0);
        if (i == 0) {
            D_800850F0.unk_10 = obj;
        }
        func_8000EC58(obj);
        x = 0xFE700000;
        if (i & 1) {
            x = 0x1900000;
        }
        obj->unk_20 = D_80073D94[i >> 1] << 16;
        obj->unk_1C = x;
        obj->unk_24 = 0;
    }
    D_800850F0.unk_10 = 0;
    if (D_80087A6A == 1) {
        record_slot_primary_set(D_8008B620[0], D_80073D7C);
        record_slot_secondary_set(D_8008B620[0], D_80073D88);
        record_slot_primary_set(D_8008B620[1], D_80073D7C);
        record_slot_secondary_set(D_8008B620[1], D_80073D88);
        D_8008B620[0]->unk_20 = 0x3440000;
        D_80085E5C = 0x3200000;
        D_8008B620[1]->unk_20 = 0xFCBC0000;
    } else {
        record_slot_primary_set(D_8008B620[0], D_80073D70);
        record_slot_primary_set(D_8008B620[1], D_80073D70);
        D_80085E5C = 0x3C00000;
    }
}
