#include "types.h"

typedef struct ModeObject {
    u8 pad00[0x8C];
    s32 value8C;
    u8 pad90[0xC];
    s32 value9C;
} ModeObject;

extern void func_800A1844(s32 value);
extern void func_800C0C8C(ModeObject *object, s32 mode);

s32 object_mode_reset_3c(ModeObject *object)
{
    func_800A1844(0);
    func_800C0C8C(object, 0x3C);
    object->value8C = 0;
    object->value9C = 0;
    return 0;
}
