#include "types.h"

extern void func_80032F3C(s32 zero, void *buffer);
extern void *func_80032E00(s32 zero, s32 size);
extern void func_80033308(s32 zero, void *buffer, s32 size, s32 value);
extern void func_8001B314(void *owner);

void resource_buffers_replace(u8 *owner, u32 *descriptor)
{
    u8 *state = *(u8 **)(owner + 8);

    if (*(u32 *)state != 0) {
        func_80032F3C(0, *(void **)(state + 0x20));
        func_80032F3C(0, *(void **)(state + 0x2C));
        *(void **)(state + 0x20) = 0;
        *(void **)(state + 0x2C) = 0;
    }
    *(u32 **)(state + 0) = descriptor;
    if (descriptor != 0) {
        s32 size = descriptor[0];
        s32 count = size;

        size++;
        {
            void *buffer = func_80032E00(0, size);
            register s32 zero __asm__("$4") = 0;

            *(void **)(state + 0x20) = buffer;
            func_80033308(zero, buffer, size, 0);
        }
        {
            register s32 zero __asm__("$4") = 0;
            void *buffer;

            __asm__ volatile ("" : : "r" (zero));
            size <<= 2;
            buffer = func_80032E00(zero, size);
            zero = 0;

            *(void **)(state + 0x2C) = buffer;
            func_80033308(zero, buffer, size, 0);
        }
        **(u32 **)(state + 0x2C) = count;
    }
    func_8001B314(owner);
}
