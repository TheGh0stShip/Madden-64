#include "types.h"

typedef union {
    s16 index;
    u8 bytes[2];
} EntryInfo;

typedef struct {
    s32 x00;
    void *resource;
    u8 pad08[0xC];
} Entry;

typedef struct {
    void *current;
} Slot;

typedef struct {
    u8 pad00[8];
    Slot *slot;
} Owner;

extern Entry *D_800724DC;

u16 runtime_entry_find(u32 input, EntryInfo *info);
void *func_80034F60(u8 value);
void func_80034E58(void *resource, s32 active);
void object_state_initialize(Owner *owner, void *resource, u32 input, u16 value);

u16 resource_selection_update(Owner *owner, u32 input, u16 value) {
    EntryInfo info;
    Slot *slot = owner->slot;
    u16 result = runtime_entry_find(input, &info);
    void *resource;

    if (result == 2 || result == 0) {
        if (result == 0) {
            resource = func_80034F60(info.bytes[1]);
            result = 2;
        } else {
            resource = D_800724DC[info.index].resource;
        }
        if (slot->current != resource) {
            func_80034E58(slot->current, 0);
            func_80034E58(resource, 1);
        }
        object_state_initialize(owner, resource, input, value);
    }
    return result;
}
