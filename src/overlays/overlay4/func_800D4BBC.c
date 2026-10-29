#include "types.h"

typedef struct Sub { u8 pad[0x14]; s32 flags; } Sub;
typedef struct Obj { u8 pad[0x24]; Sub *sub; u16 flags; u8 pad2[0x8C - 0x2A]; s32 x8C; } Obj;

s32 func_800C0BBC(Obj *, s32);

s32 func_800D4BBC(Obj *obj) {
    func_800C0BBC(obj, 0x150024);
    obj->flags |= 0x10;
    obj->sub->flags |= 0x10000;
    obj->x8C = 0;
    return 0;
}
