#include "types.h"

typedef struct {
    u32 unk_27 : 5;
    u32 unk_22 : 5;
    u32 unk_17 : 5;
    u32 unk_07 : 10;
    u32 unk_00 : 7;
} PackedState;

typedef struct {
    PackedState unk_00[11];
    PackedState unk_2C[11];
    PackedState unk_58[8];
} PackedTeam;

typedef struct {
    u8 unk_00[11];
    u8 unk_0B[11];
    u8 unk_16[8];
} BucketTeam;

typedef struct {
    u8 pad00[0x6AA0];
    PackedTeam unk_6AA0[1];
} PlayTable;

typedef struct {
    u8 pad00[0x14];
    u16 unk_14;
} ObjectInfo;

typedef struct {
    u8 pad00[8];
    ObjectInfo *unk_08;
    u8 pad0C[0xC];
    s32 unk_18;
    u8 pad1C[8];
    s32 unk_24;
} ObjectState;

typedef struct {
    u8 pad00[0x24];
    ObjectState *unk_24;
    u8 pad28[0x88];
} Object;

typedef struct {
    s16 unk_00;
    s16 unk_02;
    s16 unk_04;
    s16 unk_06;
} LastPosition;

extern PlayTable *D_800718E8;
extern Object *D_80085040[];
extern Object *D_80085098[];
extern LastPosition D_80085190[];
extern Object D_80087138[];

s16 func_800B5DC0(Object *, s32);
u8 oriented_value_bucket(Object *);

void func_800B859C(u16 arg0) {
    s32 i;
    PackedState *packed;
    u8 *bucket;
    Object *obj;

    packed = D_800718E8->unk_6AA0[arg0].unk_00;
    bucket = (u8 *)D_800718E8 + 0x1661C + arg0 * sizeof(BucketTeam);

    for (i = 0; (u16)i < 11; i++) {
        obj = D_80085040[(u16)i];
        packed[(u16)i].unk_27 = func_800B5DC0(obj, 0) - D_80085190[(u16)i].unk_00;
        packed[(u16)i].unk_22 = func_800B5DC0(obj, 1) - D_80085190[(u16)i].unk_02;
        packed[(u16)i].unk_17 = (obj->unk_24->unk_24 >> 16) - D_80085190[(u16)i].unk_04;
        D_80085190[(u16)i].unk_00 = func_800B5DC0(obj, 0);
        D_80085190[(u16)i].unk_02 = func_800B5DC0(obj, 1);
        D_80085190[(u16)i].unk_04 = (obj->unk_24->unk_24 >> 16);
        bucket[(u16)i] = oriented_value_bucket(obj);
        packed[(u16)i].unk_07 = obj->unk_24->unk_18;
        packed[(u16)i].unk_00 = obj->unk_24->unk_08->unk_14 >> 8;
    }

    for (i = 0; (u16)i < 11; i++) {
        obj = D_80085098[(u16)i];
        packed[(u16)i + 11].unk_27 = func_800B5DC0(obj, 0) - D_80085190[(u16)i + 11].unk_00;
        packed[(u16)i + 11].unk_22 = func_800B5DC0(obj, 1) - D_80085190[(u16)i + 11].unk_02;
        packed[(u16)i + 11].unk_17 = (obj->unk_24->unk_24 >> 16) - D_80085190[(u16)i + 11].unk_04;
        D_80085190[(u16)i + 11].unk_00 = func_800B5DC0(obj, 0);
        D_80085190[(u16)i + 11].unk_02 = func_800B5DC0(obj, 1);
        D_80085190[(u16)i + 11].unk_04 = (obj->unk_24->unk_24 >> 16);
        bucket[(u16)i + 11] = oriented_value_bucket(obj);
        packed[(u16)i + 11].unk_07 = obj->unk_24->unk_18;
        packed[(u16)i + 11].unk_00 = obj->unk_24->unk_08->unk_14 >> 8;
    }

    for (i = 0; (u16)i < 4; i++) {
        obj = &D_80087138[(u16)i];
        packed[(u16)i + 22].unk_27 = func_800B5DC0(obj, 0) - D_80085190[(u16)i + 22].unk_00;
        packed[(u16)i + 22].unk_22 = func_800B5DC0(obj, 1) - D_80085190[(u16)i + 22].unk_02;
        packed[(u16)i + 22].unk_17 = (obj->unk_24->unk_24 >> 16) - D_80085190[(u16)i + 22].unk_04;
        D_80085190[(u16)i + 22].unk_00 = func_800B5DC0(obj, 0);
        D_80085190[(u16)i + 22].unk_02 = func_800B5DC0(obj, 1);
        D_80085190[(u16)i + 22].unk_04 = (obj->unk_24->unk_24 >> 16);
        bucket[(u16)i + 22] = oriented_value_bucket(obj);
        packed[(u16)i + 22].unk_07 = obj->unk_24->unk_18;
        packed[(u16)i + 22].unk_00 = obj->unk_24->unk_08->unk_14 >> 8;
    }
}
