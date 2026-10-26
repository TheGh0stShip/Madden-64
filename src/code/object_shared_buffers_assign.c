#include "types.h"

extern void *func_8006056C(void *object);

typedef struct SharedBufferSlot {
    u8 pad00[0x20];
    u32 key;
    u8 pad24[0x10];
    void *buffer;
} SharedBufferSlot;

void object_shared_buffers_assign(u8 *object)
{
    register u8 *saved_object __asm__("$18") = object;
    register u8 *base __asm__("$19") = *(u8 **)(object + 0x1C8);
    register u8 *slot __asm__("$17");
    register s32 outer __asm__("$16") = 0;
    volatile u8 frame_pad[16];

    if (*(s32 *)(saved_object + 0x78) > 0) {
        slot = base;
        do {
            s32 inner = 0;
            register u32 key __asm__("$5") = *(u32 *)(slot + 0x20);
            register void *buffer __asm__("$6") = 0;

            if (outer > 0) {
                u8 *cursor = base;
                do {
                    volatile SharedBufferSlot *candidate = (SharedBufferSlot *)cursor;
                    if (key != candidate->key) {
                        inner++;
                    } else {
                        buffer = candidate->buffer;
                        goto found;
                    }
                    cursor += 4;
                } while (inner < outer);
            }
found:
            if (buffer == 0) {
                buffer = func_8006056C(saved_object);
            }
            *(void **)(slot + 0x34) = buffer;
            outer++;
            slot += 4;
        } while (outer < *(s32 *)(saved_object + 0x78));
    }
}
