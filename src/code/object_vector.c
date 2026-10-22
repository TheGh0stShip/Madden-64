#include "types.h"

typedef struct FixedVector {
    s32 x;
    s32 y;
    s32 z;
} FixedVector;

void func_8000C9C8(u8* object, FixedVector* vector) {
    if (*(u16*)(object + 0x206) & 0x100) {
        vector->x = -((s32)*(s16*)(object + 0x20) << 16);
        vector->y = -((s32)*(s16*)(object + 0x22) << 16);
    } else {
        vector->x = (s32)*(s16*)(object + 0x20) << 16;
        vector->y = (s32)*(s16*)(object + 0x22) << 16;
    }
    vector->z = (s32)*(s16*)(object + 0x24) << 16;
}
