#include "types.h"

typedef struct Inner {
    u8 pad0[0x14];
    u32 flags;
    u8 pad18[0x14];
    u32 field2C;
    u32 field30;
} Inner;

typedef struct Object {
    u8 pad0[0x24];
    Inner* inner;
    u16 flags;
    u8 pad2A[0x62];
    s32 field8C;
    u32 field90;
} Object;

extern s32 func_800C0BBC(Object* object, s32 command);

s32 func_800E4C84(Object* object) {
    Inner* inner;

    func_800C0BBC(object, 0x1C);
    object->inner->flags |= 0x10000;
    object->flags |= 0x10;
    inner = object->inner;
    object->field8C = 0;
    object->field90 = inner->field2C | inner->field30;
    return 0;
}
