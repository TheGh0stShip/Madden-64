#include "types.h"

typedef struct ObjectSubD4EB8 {
    u8 pad0[0x14];
    s32 flags;
} ObjectSubD4EB8;

typedef struct ObjectD4EB8 {
    u8 pad0[0x17];
    u8 type;
    u8 pad18[0xC];
    ObjectSubD4EB8* sub;
    u16 flags;
    u8 pad2A[0x3B];
    u8 direction;
    u8 pad66[0x26];
    s32 timer;
} ObjectD4EB8;

s32 func_800C0BBC(ObjectD4EB8*, s32);
s16 func_800C1608(ObjectD4EB8*);
s32 func_800C9090(ObjectD4EB8*);

extern s16 D_80085112[];

s32 func_800D4EB8(ObjectD4EB8* object) {
    s16 forward;
    s16 backward;
    s16 adjacent;
    s16 forward_sum;
    s32 forward_value;
    s32 backward_sum;

    if (object->direction == 0) {
        func_800C9090(object);
        forward = func_800C1608(object) + 2;
        adjacent = D_80085112[forward & 7] + D_80085112[(forward - 1) & 7];
        forward_sum = D_80085112[(forward + 1) & 7] + adjacent;
        backward = func_800C1608(object) - 2;
        forward_value = forward_sum;
        backward_sum = D_80085112[backward & 7] + D_80085112[(backward - 1) & 7]
                     + D_80085112[(backward + 1) & 7];
        object->direction = (forward_value >= backward_sum) ? 1 : 2;
    }

    if (object->direction == 1) {
        func_800C0BBC(object, 9);
    } else {
        func_800C0BBC(object, 10);
    }
    object->sub->flags |= 0x10000;
    object->flags |= 0x10;
    object->timer = (object->type >> 4) + 0x14;
    return 0;
}
