#include "types.h"

typedef struct {
    u8 pad00[0xE];
    u8 unkE;
    u8 pad0F[0x20 - 0xF];
    u8 unk20;
    u8 pad21[0x8C - 0x21];
    s32 unk8C;
    s32 unk90;
    s32 unk94;
} ObjectD4754;

s16 func_8001FA38(s32 arg);
s32 func_80031A1C(s32 arg);

s32 func_800D4754(ObjectD4754 *object) {
    object->unk8C = 10 - func_8001FA38(7);
    object->unk90 = ((object->unkE >> 3) -
                     -((u16)func_80031A1C(12) + 0x18)) * object->unk8C;
    object->unk94 = -1;
    object->unk8C = object->unk90 * 20;
    object->unk90 = 0;
    if ((u16)func_80031A1C((u16)func_8001FA38(7)) != 0) {
        return object->unk20 == 7;
    }
    return 1;
}
