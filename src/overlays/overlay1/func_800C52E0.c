#include "types.h"

typedef struct {
    u8 pad00[0x14];
    s32 flags;
} Model;

typedef struct {
    u8 pad00[0x24];
    Model *model;
    u8 pad28[4];
    s32 anim;
} Object;

void func_80034388(Model *, s32);
s32 func_80035064(Model *, s32, s32);

u16 func_800C52E0(Object *obj, s32 anim) {
    u16 result;

    if (!(obj->model->flags & 0x10000)) {
        obj->model->flags &= 0xFFC3FFFF;
        if ((u32)(anim & 0xFF00) > 0x200) {
            result = func_80035064(obj->model, anim, 0);
            switch (result) {
                case 0:
                case 1:
                    result = 2;
                    break;
                case 2:
                    obj->anim = anim;
                    result = 0;
                    break;
                case 3:
                    result = 3;
                    break;
            }
        } else {
            obj->anim = anim;
            func_80034388(obj->model, anim);
            result = 0;
        }
        return result;
    }
    return 1;
}
