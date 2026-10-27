#include "types.h"

typedef void *(*ObjectAllocate)(void *object, s32 count, u32 size);

typedef struct ObjectAllocator {
    ObjectAllocate allocate;
} ObjectAllocator;

extern void func_8002E58C(void *pointer, s32 value, u32 size);

void func_80055A80(u8 *object)
{
    u8 *work;
    s32 index;
    u8 *cursor;
    u8 *end;

    work = (*(ObjectAllocator **)(object + 4))->allocate(object, 1, 0x580) + 0x100;
    __asm__("" : "=r"(work) : "0"(work));
    *(u8 **)(object + 0x140) = work;
    func_8002E58C(work - 0x100, 0, 0x100);

    index = 0xFF;
    cursor = work + 0xFF;
    do {
        *cursor = index;
        index--;
        cursor--;
    } while (index >= 0);

    work += 0x80;
    {
        register s32 fill __asm__("$5") = 0xFF;

        cursor = work + 0x80;
        end = work + 0x200;
        do {
            *cursor = fill;
            cursor++;
        } while ((s32)cursor < (s32)end);
    }

    func_8002E58C(work + 0x200, 0, 0x180);
    __builtin_memcpy(work + 0x380, *(void **)(object + 0x140), 0x80);
}
