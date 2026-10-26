#include "types.h"

extern u8 D_80078300[];
extern u8 D_80078304[];
extern u8 D_80078308[];
extern u8 D_80078320[];
extern void func_8000E05C(u32 slot);

void vector_slot_negate_store(const s32 *vector, u32 unused, u32 slot,
                              u32 active)
{
    register const volatile s32 *saved_vector __asm__("$8") = vector;
    register u32 saved_slot __asm__("$16") = slot;
    register u32 saved_active __asm__("$17") = (u8)active;
    register u32 slot_index __asm__("$4");
    register u32 offset __asm__("$3");
    register u32 post_index __asm__("$3");
    register u32 post_offset __asm__("$2");
    __asm__("" : "=r"(saved_vector) : "0"(saved_vector));

    (void)unused;
    if (saved_active != 0) {
        slot_index = (u8)saved_slot;
        offset = slot_index << 2;
        offset += slot_index;
        offset <<= 3;
        *(volatile s32 *)(D_80078300 + offset) = -saved_vector[0];
        __asm__ volatile("" ::: "memory");
        *(volatile s32 *)(D_80078304 + offset) = -saved_vector[2];
        __asm__ volatile("" ::: "memory");
        *(volatile s32 *)(D_80078308 + offset) = -saved_vector[1];
        func_8000E05C(slot_index);
    }
    post_index = (u8)saved_slot;
    post_offset = post_index << 2;
    post_offset += post_index;
    post_offset <<= 3;
    *(u32 *)(D_80078320 + post_offset) = saved_active;
}
