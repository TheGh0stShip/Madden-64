#include "types.h"

typedef struct ValueTarget {
    u8 pad00[0x1C];
    u8 *values;
    u8 pad20[0x40];
    u16 value60;
} ValueTarget;

typedef struct ValueOwner {
    u8 pad00[8];
    ValueTarget *target;
    u8 pad0C[0xC];
    s32 index;
} ValueOwner;

extern void func_800954E0(ValueOwner *owner, ValueTarget *target);

void object_table_value_apply(ValueOwner *owner)
{
    ValueTarget *target = owner->target;

    target->value60 = *(u16 *)(target->values + owner->index * 0x10);
    func_800954E0(owner, target);
}
