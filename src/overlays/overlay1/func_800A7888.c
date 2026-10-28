#include "types.h"

typedef struct {
    s16 unk00;
    s16 state;
    u8 pad04[0x18];
    u8 unk1C[0x40];
    u8 unk5C[0x28];
    u16 flags;
} Object;

typedef struct {
    u8 pad00[4];
    u16 unk04;
    u8 pad06[0x1EE];
    Object *object;
} Model;

extern u16 D_8006A7C0[];
extern void (*D_8006A740[])(Object *);
extern u16 D_8008A5B4;

void func_8000B7A4(Model *, u16);
void func_8000C9AC(Model *, void *);
void func_8000CA20(Model *, void *);
void func_800A5AEC(Object *);
void func_800A5FD0(Object *);
void func_800A61E4(Object *);

void func_800A7888(Model *model) {
    Object *obj = model->object;
    u16 i;
    u16 id;

    if (!(obj->flags & 8)) {
        D_8006A740[obj->state](obj);
    }
    if (!(obj->flags & 0x10)) {
        for (i = 0; i < D_8008A5B4; i++) {
            if (obj->flags & 4) {
                func_800A5AEC(obj);
            } else if (obj->flags & 0x400) {
                func_800A5FD0(obj);
            } else {
                func_800A61E4(obj);
            }
        }
        obj->flags &= 0xFFFE;
    }
    func_8000C9AC(model, obj->unk5C);
    func_8000CA20(model, obj->unk1C);
    id = D_8006A7C0[obj->state];
    if (model->unk04 != id) {
        func_8000B7A4(model, id);
    }
}
