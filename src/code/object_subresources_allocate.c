#include "types.h"

typedef void *(*AllocateFunction)(void *owner, s32 count, s32 size);

extern void func_8002E58C(void *pointer, s32 value, s32 size);
extern void func_8005D018(void);

void object_subresources_allocate(void *owner)
{
    u8 *saved_owner = owner;
    AllocateFunction allocate = *(AllocateFunction *)(*(u8 **)(saved_owner + 4));
    u8 *header = allocate(saved_owner, 1, 0x54);
    s32 index;
    u8 *record;
    void *pointer;

    *(u8 **)(saved_owner + 0x1BC) = header;
    *(void (**)(void))header = func_8005D018;

    for (index = 0, record = *(u8 **)(saved_owner + 0xD8);
         index < *(s32 *)(saved_owner + 0x20);
         index++, record += 0x54) {
        allocate = *(AllocateFunction *)(*(u8 **)(saved_owner + 4));
        pointer = allocate(saved_owner, 1, 0x100);
        *(void **)(record + 0x50) = pointer;
        func_8002E58C(pointer, 0, 0x100);
        *(s32 *)(header + 0x2C + index * 4) = -1;
    }
}
