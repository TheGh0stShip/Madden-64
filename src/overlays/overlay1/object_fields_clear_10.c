#include "types.h"

typedef struct ClearObject {
    u8 pad00[8];
    void *resource;
    u8 pad0C[0x10];
    s32 value1C;
    s32 value20;
    s32 value24;
} ClearObject;

extern void func_80033308(s32 first, void *resource, s32 size, s32 fourth);

void object_fields_clear_10(ClearObject *object)
{
    func_80033308(0, object->resource, 0x10, 0);
    object->value24 = 0;
    object->value20 = 0;
    object->value1C = 0;
}
