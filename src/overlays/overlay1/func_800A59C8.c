#include "types.h"

typedef struct {
    u8 pad00[0x14];
    s32 flags;
} ObjInfo;

typedef struct {
    u8 pad00[0x24];
    ObjInfo *info;
    u8 pad28[8];
    s16 timer;
    u8 pad32[0x62];
    s32 state;
} Obj;

extern volatile u16 D_8008A5B4;

void func_800C0BBC(Obj *, s32);
void func_800C0C8C(Obj *, s32);

s32 func_800A59C8(Obj *obj) {
    switch (obj->state) {
        case 0:
            if (!(obj->info->flags & 0x20000)) {
                obj->state = 1;
                if (obj->timer < 20) {
                    obj->timer = 20;
                }
                if (obj->timer > 40) {
                    obj->timer = 40;
                }
            }
            return 0;
        case 1:
            if (obj->timer > 0) {
                obj->timer -= D_8008A5B4;
                return 0;
            }
            func_800C0BBC(obj, 0x43);
            obj->timer = 0;
            obj->state = 2;
            return 0;
        case 2:
            if (!(obj->info->flags & 0x20000)) {
                func_800C0C8C(obj, 0x3C);
                return 1;
            }
            return 0;
    }
    return 0;
}
