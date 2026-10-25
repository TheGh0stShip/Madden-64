#include "types.h"

typedef struct IndexedValueObject {
    u8 pad00[2];
    u16 type;
    s32 values[1];
} IndexedValueObject;

extern s16 func_80031A1C(u16 type);

s32 object_indexed_value_get(IndexedValueObject *object)
{
    return object->values[func_80031A1C(object->type)];
}
