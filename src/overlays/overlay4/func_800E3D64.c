#include "types.h"

typedef struct {
    u8 pad00[0x28];
    u16 flags;
    u8 pad2A[0x8C - 0x2A];
    s32 timer;
} TimedObject;

extern u16 D_8008A5B4;

s32 func_800E3D64(TimedObject *obj) {
    s32 remaining;

    remaining = obj->timer - D_8008A5B4;
    obj->timer = remaining;
    if (remaining < 0) {
        obj->flags &= 0xFFEF;
        return 1;
    }
    return 0;
}
