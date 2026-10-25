#include "types.h"

typedef struct ActivatedObject {
    u8 pad00[0x21];
    u8 state;
    u8 pad22[6];
    u16 flags;
} ActivatedObject;

extern ActivatedObject *D_800880F0[];
extern s32 func_800BDAE8(u16 index);
extern void func_800BFF60(ActivatedObject *object);

void indexed_object_activate(ActivatedObject *object, s32 index)
{
    u16 normalized = index;

    if (func_800BDAE8(normalized) != 0) {
        func_800BFF60(D_800880F0[normalized]);
        object->state = index + 0x40;
        D_800880F0[normalized] = object;
        object->flags &= ~1;
    }
}
