#include "types.h"

typedef struct {
    u8 pad00[0x14];
    s32 flags;
} Model;

typedef struct {
    u8 pad00[0x1F];
    u8 unk1F;
    u8 unk20;
    u8 pad21[3];
    Model *model;
    u8 pad28[0x3C];
    u8 kind;
} Object;

typedef struct {
    Object *members[22];
} Group;

extern Group D_80085040[];
extern s16 D_80088AE4;
extern u16 D_8008B672;

s16 weighted_group_object_count(void) {
    s16 weight;
    s16 i;
    Object *obj;
    u8 kind;

    weight = 0;
    for (i = 0; i < (s32)(D_8008B672 >> 1); i++) {
        obj = (D_80085040 + D_80088AE4)->members[i];
        if (obj->unk1F == 0 && obj->unk20 == 0) {
            if (obj->kind != 0) {
                if (obj->kind != 0x27) {
                    weight += 2;
                }
            }
        } else {
            kind = obj->kind;
            if (kind == 3) {
                weight += 2;
            }
            if (obj->model->flags & 0x20000) {
                weight += 1;
            } else if (kind != 0) {
                if (kind != 0x27) {
                    weight += 1;
                }
            }
        }
    }
    return weight;
}
