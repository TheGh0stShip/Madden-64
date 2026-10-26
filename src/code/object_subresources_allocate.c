#include "types.h"

typedef void *(*AllocateFunction)(void *owner, s32 count, s32 size);

extern void func_8002E58C(void *pointer, s32 value, s32 size);
extern void func_8005D018(void);

void object_subresources_allocate(void *owner)
{
    register u8 *saved_owner __asm__("$16") = owner;
    AllocateFunction allocate = *(AllocateFunction *)(*(u8 **)(saved_owner + 4));
    u8 *header = allocate(saved_owner, 1, 0x54);
    s32 count;
    register s32 index __asm__("$17");
    u8 *record;
    u8 *slot;
    s32 sentinel;
    void *pointer;
    volatile s32 stack_space[2];
    register s32 one __asm__("$5");
    register s32 size __asm__("$6");

    *(u8 **)(saved_owner + 0x1BC) = header;
    *(void (**)(void))header = func_8005D018;
    count = *(s32 *)(saved_owner + 0x20);
    record = *(u8 **)(saved_owner + 0xD8);
    if (count > 0) {
        index = 0;
        sentinel = -1;
        slot = header;
        do {
            one = 1;
            size = 0x100;
            allocate = *(AllocateFunction *)(*(u8 **)(saved_owner + 4));
            pointer = allocate(saved_owner, one, size);
            index++;
            *(void **)(record + 0x50) = pointer;
            func_8002E58C(pointer, 0, 0x100);
            *(s32 *)(slot + 0x2C) = sentinel;
            slot += 4;
            record += 0x54;
        } while (index < *(s32 *)(saved_owner + 0x20));
    }
}
