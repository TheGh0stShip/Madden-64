#include "types.h"

typedef struct ObjectLink {
    u8 pad00[0x16];
    s16 enabled;
} ObjectLink;

typedef struct SceneObject {
    u8 pad00[0xC];
    void *resource;
    u8 pad10[4];
    s32 type;
    u8 pad18[4];
    s32 position_x;
    s32 position_y;
    s32 position_z;
    u8 pad28[4];
    s32 velocity_x;
    s32 velocity_y;
    s32 velocity_z;
    u8 pad38[4];
    s16 active;
    u8 pad3E[2];
    s32 field40;
    s32 field44;
    ObjectLink *link;
} SceneObject;

typedef struct Vec3s {
    s16 x;
    s16 y;
    s16 z;
} Vec3s;

typedef struct Vec3i {
    s32 x;
    s32 y;
    s32 z;
} Vec3i;

SceneObject *func_8000D740(s32, s32, s32);
void func_8000EC58(SceneObject *);
void func_8000EC8C(SceneObject *, Vec3s *);
void func_8000ED24(SceneObject *, Vec3i *);
void func_800B95D8(SceneObject *);
void func_800B96C0(SceneObject *, void *);
void func_800C6194(s32);

extern u8 D_800695F8[];
extern SceneObject *D_80086178;
extern s32 D_80087B54;
extern u8 D_800C63E4[];

void func_800C78C8(s32 arg0, s32 arg1) {
    Vec3s rotation;
    Vec3i scale;
    SceneObject *object;
    s32 one;

    object = func_8000D740(arg0, 8, arg1);
    one = 1;
    object->field44 = 0x800;
    object->field40 = 0xD00;
    D_80086178 = object;
    object->position_x = 0;
    object->position_y = 0;
    object->position_z = 0;
    object->velocity_x = 0;
    object->velocity_y = 0;
    object->velocity_z = 0;
    D_80086178->active = one;
    object->type = 0x71;
    object->resource = D_800C63E4;
    func_800B95D8(object);
    D_80086178->link->enabled = one;
    func_8000EC58(D_80086178);
    rotation.x = 0;
    rotation.y = 0;
    rotation.z = 0;
    func_8000EC8C(D_80086178, &rotation);
    scale.z = 0x3333;
    scale.y = 0x3333;
    scale.x = 0x3333;
    func_8000ED24(D_80086178, &scale);
    func_800B96C0(D_80086178, D_800695F8);
    func_8000EC58(D_80086178);
    func_800C6194(0);
    D_80087B54 = 0;
}
