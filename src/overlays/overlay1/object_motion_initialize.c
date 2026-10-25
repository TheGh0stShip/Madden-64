#include "types.h"

typedef void (*ObjectCallback)(void *object);

typedef struct MotionObject {
    u8 pad00[2];
    s16 type;
    u8 pad04[0x38];
    s32 value3C;
    s32 value40;
    s32 value44;
    u8 pad48[0x18];
    s16 value60;
    u8 pad62[6];
    s16 value68;
    u8 pad6A[2];
    s16 value6C;
    s16 value6E;
    s16 value70;
    u8 pad72[0x12];
    u16 flags84;
} MotionObject;

extern ObjectCallback D_8006A740[];

void object_motion_initialize(MotionObject *object)
{
    s32 type;
    u16 flags;

    flags = object->flags84;
    type = object->type;
    object->value3C = 0;
    object->value40 = 0;
    object->value44 = 0;
    object->value6C = 0;
    object->value6E = 0;
    object->value70 = 0;
    object->flags84 = flags | 5;
    D_8006A740[type](object);
    object->value70 = (object->value68 - object->value60) >> 5;
}
