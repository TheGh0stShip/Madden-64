#include "types.h"

typedef struct {
    u8 pad00[0x14];
    s32 flags;
    u8 pad18[0x1C - 0x18];
    s32 x;
    s32 y;
    u8 pad24[0x2C - 0x24];
    s32 unk_2C;
    s32 unk_30;
} Body;

typedef struct {
    u8 pad00[0x24];
    Body *body;
    u16 unk_28;
    u8 pad2A[0x8C - 0x2A];
    s32 state;
} Obj;

extern Body *D_800886E4;
void func_800C0BBC(Obj *obj, s32 id);
s16 func_800B9208(s32 *vec);
void func_800C0018(Obj *obj, s16 angle, s32 arg2);
void object_resource_prepare(Obj *obj, s32 id);

s32 func_800A5808(Obj *obj) {
    s32 vec[3];
    s32 dx;
    s32 dy;

    switch (obj->state) {
    case 0:
        dx = vec[0] = D_800886E4->x - obj->body->x;
        if (dx < 0) {
            dx = -dx;
        }
        dy = vec[1] = D_800886E4->y - obj->body->y;
        if (dy < 0) {
            dy = -dy;
        }
        if (dx <= 0x7FFFF && dy <= 0x7FFFF) {
            obj->body->unk_2C = 0;
            obj->body->unk_30 = 0;
            obj->state = 3;
            func_800C0BBC(obj, 0x3E);
        }
        func_800C0018(obj, func_800B9208(vec), 0);
        return 0;
    case 3:
        if (obj->body->flags & 0x40000) {
            obj->state = 4;
            obj->unk_28 &= 0xFFDF;
            D_800886E4->flags &= ~1;
        }
        return 0;
    case 4:
        if (!(obj->body->flags & 0x20000)) {
            object_resource_prepare(obj, 0x41);
            return 1;
        }
        return 0;
    }
    return 0;
}
