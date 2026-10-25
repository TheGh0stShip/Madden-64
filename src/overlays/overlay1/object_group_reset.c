#include "types.h"

typedef struct GroupObject {
    u8 pad00[0x3C];
    u16 value3C;
} GroupObject;

extern GroupObject *D_80085D48[14];
extern void func_80097D28(GroupObject *object, s32 first, s32 second);

void object_group_reset(void)
{
    s16 index;

    for (index = 0; index < 14; index++) {
        D_80085D48[index]->value3C = 0xFFFF;
        func_80097D28(D_80085D48[index], 0, 0);
    }
}
