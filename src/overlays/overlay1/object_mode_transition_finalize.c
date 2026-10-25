#include "types.h"

typedef struct ModeFinalizeObject {
    u8 pad00[0x28];
    u16 flags;
    u8 pad2A[0x3A];
    u8 mode;
} ModeFinalizeObject;

extern void func_800C11EC(ModeFinalizeObject *object, s32 value);
extern void func_800E1C98(ModeFinalizeObject *object);
extern void func_800E1A84(ModeFinalizeObject *object, u8 *command);
extern void func_8003EE10(ModeFinalizeObject *object);

void object_mode_transition_finalize(ModeFinalizeObject *object)
{
    u8 command;

    if (object->flags & 8) {
        func_800C11EC(object, 0x28);
    }
    if (object->mode != 5 && object->mode != 6 && object->mode != 0x1A) {
        func_800E1C98(object);
        command = 0x1A;
        func_800E1A84(object, &command);
    }
    func_8003EE10(object);
}
