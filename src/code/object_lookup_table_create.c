#include "types.h"

typedef struct ObjectMethods2 {
    void *allocate;
} ObjectMethods2;

typedef struct LookupState {
    u8 pad00[0x28];
    s32 *table;
} LookupState;

typedef struct LookupObject {
    u8 pad00[4];
    ObjectMethods2 *methods;
    u8 pad08[0x1C0];
    LookupState *state;
} LookupObject;

typedef void *(*AllocateMethod2)(LookupObject *, s32, u32);

void object_lookup_table_create(LookupObject *object)
{
    register ObjectMethods2 *methods __asm__("$2");
    register LookupState *state __asm__("$16");
    s32 *allocation;
    register s32 value __asm__("$4");
    register s32 index __asm__("$3");
    register s32 *center __asm__("$7");
    register s32 *negative __asm__("$6");
    register s32 *positive __asm__("$5");
    register u32 offset __asm__("$2");
    s32 negative_value;

    methods = object->methods;
    state = object->state;
    __asm__("" : "=r"(methods) : "0"(methods), "r"(state));
    allocation = ((AllocateMethod2)methods->allocate)(object, 1, 0x7FC);
    value = 0;
    index = 0;
    center = (s32 *)((u8 *)allocation + 0x3FC);
    negative = center;
    positive = center;
    state->table = center;
    do {
        *positive = value;
        *negative = -value;
        negative--;
        positive++;
        index++;
        value++;
    } while (index < 0x10);
    if (index < 0x30) {
        offset = index << 2;
        negative = (s32 *)((u8 *)center - offset);
        positive = (s32 *)(offset + (u32)center);
        do {
            *positive = value;
            *negative = -value;
            negative--;
            index++;
            value += (index ^ 1) & 1;
            positive++;
        } while (index < 0x30);
    }
    if (index < 0x100) {
        negative_value = -value;
        offset = index << 2;
        negative = (s32 *)((u8 *)center - offset);
        positive = (s32 *)(offset + (u32)center);
        do {
            *positive = value;
            *negative = negative_value;
            negative--;
            index++;
            positive++;
        } while (index < 0x100);
    }
}
