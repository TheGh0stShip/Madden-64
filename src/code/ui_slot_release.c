#include "types.h"

typedef struct UiSlotOwner {
    u8 pad00[0x18];
    void *owner18;
    u8 pad1C[8];
    u8 *flags24;
    void **resources28;
} UiSlotOwner;

typedef struct UiSlot {
    u8 pad00[8];
    UiSlotOwner *owner8;
} UiSlot;

extern void *D_8008931C;
extern void func_8000D874(void *owner, void *resource);
extern void func_8000D834(void *owner, void *resource);

void ui_slot_release(UiSlot *slot, s32 index)
{
    UiSlotOwner *owner = slot->owner8;
    u8 *flag = owner->flags24 + index;
    s32 offset;

    if (*flag & 0x80) {
        *flag &= 0x7F;
        offset = index << 2;
        func_8000D874(owner->owner18, *(void **)(offset + (u32)owner->resources28));
        func_8000D834(D_8008931C, *(void **)(offset + (u32)owner->resources28));
        *(void **)(offset + (u32)owner->resources28) = 0;
    }
}
