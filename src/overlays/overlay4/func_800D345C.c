#include "types.h"

typedef struct SubStateD345C {
    u8 pad00[0x14];
    s32 flags;
    u8 pad18[0xC];
    s32 status;
} SubStateD345C;

typedef struct ObjectD345C {
    u8 pad00[0x24];
    SubStateD345C* volatile sub;
    u16 flags;
    u8 pad2A[6];
    s16 timer;
} ObjectD345C;

extern s32 func_80033B20(SubStateD345C*, s32);
extern s32 func_800B96C0(SubStateD345C*, s32*);
extern s32 func_800C0C8C(ObjectD345C*, s32);

extern s32 D_80074824;
extern volatile u16 D_8008A5B4;

s32 func_800D345C(ObjectD345C* object) {
    SubStateD345C* sub;

    object->timer -= D_8008A5B4;
    if (object->timer < 0) {
        object->timer = 0;
    }
    if (object->sub->status == 0) {
        sub = object->sub;
        object->flags &= ~0x10;
        sub->flags &= ~0x10000;
        func_800C0C8C(object, 0x60008);
        func_80033B20(object->sub, 0x18);
        func_800B96C0(object->sub, &D_80074824);
        return 1;
    }
    return 0;
}
