#include "types.h"

typedef struct {
    u8 unk_00[2];
    u16 unk_02;
    s32 unk_04[1];
} IndexedObject;

s16 func_80031A1C(u16 value);

s32 func_800BD370(IndexedObject *object) {
    return object->unk_04[func_80031A1C(object->unk_02)];
}
