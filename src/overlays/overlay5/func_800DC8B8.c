#include "types.h"

typedef struct ObjectDC8B8 {
    u8 pad00[0x0A];
    u16 first;
    u8 count;
    u8 pad0D[0x0F];
    u8 entry_count;
    u8 pad1D[0x07];
    u8 *enabled;
    u8 *offsets;
    u8 pad2C[0x18];
    void *target;
} ObjectDC8B8;

extern void func_8001ECAC(void *target, s32 index, s32 mode);

void func_800DC8B8(ObjectDC8B8 *object, u8 type, s32 mode) {
    u32 i;

    if (type >= object->first && type < object->first + object->count) {
        for (i = 0; i < object->entry_count; i++) {
            u8 offset = object->offsets[i];
            u8 enabled = object->enabled[i];
            s32 index = offset + type - object->first;

            if (enabled != 0) {
                func_8001ECAC(object->target, index, mode);
            }
        }
    }
}
