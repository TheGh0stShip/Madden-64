#include "types.h"

typedef void (*ObjectAction)(void *object);
typedef void *(*ObjectAllocate)(void *object, s32 count, u32 size);

typedef struct ObjectEvent {
    ObjectAction dispatch;
    u8 pad04[0x10];
    s32 type;
    s32 value;
} ObjectEvent;

typedef struct ObjectAllocator {
    ObjectAllocate allocate;
} ObjectAllocator;

typedef struct ResourceBlock {
    u32 words[33];
} ResourceBlock;

void func_800566DC(u8 *object)
{
    u8 *record;
    ResourceBlock *copy;
    s32 type;
    s32 index;

    index = 0;
    while (index < *(s32 *)(object + 0x144)) {
        record = *(u8 **)(object + 0x148 + index * 4);
        if (*(void **)(record + 0x4C) == 0) {
            type = *(s32 *)(record + 0x10);
            if ((u32)type >= 4 || *(void **)(object + 0xA4 + type * 4) == 0) {
                (*(ObjectEvent **)object)->type = 0x33;
                (*(ObjectEvent **)object)->value = type;
                (*(ObjectEvent **)object)->dispatch(object);
            }
            copy = (*(ObjectAllocator **)(object + 4))->allocate(object, 1, 0x84);
            *copy = **(ResourceBlock **)(object + 0xA4 + type * 4);
            *(void **)(record + 0x4C) = copy;
        }
        index++;
    }
}
