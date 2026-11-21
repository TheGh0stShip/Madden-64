#include "types.h"

typedef struct {
    s32 *(*unk_00)(void *, s32, s32);
} ObjectMethods;

typedef struct {
    u8 pad00[0x28];
    s32 *unk_28;
} LookupState;

typedef struct {
    u8 pad00[0x4];
    ObjectMethods *unk_04;
    u8 pad08[0x1C0];
    LookupState *unk_1C8;
} LookupObject;

void object_lookup_table_create(LookupObject *object)
{
    LookupState *state = object->unk_1C8;
    s32 *table = object->unk_04->unk_00(object, 1, 0x7FC) + 0xFF;
    s32 value = 0;
    s32 i = 0;

    state->unk_28 = table;
    for (; i < 0x10; i++, value++) {
        table[i] = value;
        table[-i] = -value;
    }
    for (; i < 0x30; ) {
        table[i] = value;
        table[-i] = -value;
        i++;
        value += (i ^ 1) & 1;
    }
    for (; i < 0x100; i++) {
        table[i] = value;
        table[-i] = -value;
    }
}
