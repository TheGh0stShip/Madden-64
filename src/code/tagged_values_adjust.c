#include "types.h"

typedef struct ValueArray {
    u32 pad0;
    u16 count;
    u16 stride;
} ValueArray;

typedef struct TaggedValues {
    u32 tag;
    u8 pad4[0x18];
    ValueArray* array;
    u32 offset;
} TaggedValues;

extern void func_80034768(TaggedValues* values, u16 count, u16 stride,
                          u32 offset);
extern void func_800347B4(TaggedValues* values);

void func_80034804(TaggedValues* values, u32 offset) {
    if (values->tag == 0x54537072) {
        func_80034768(values, values->array->count, values->array->stride,
                      offset + values->offset);
    } else {
        func_800347B4(values);
    }
}
