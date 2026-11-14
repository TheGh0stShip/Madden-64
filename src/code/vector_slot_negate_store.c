#include "types.h"

extern u8 D_80078300[];
extern u8 D_80078304[];
extern u8 D_80078308[];
extern u8 D_80078320[];
extern void func_8000E05C(u8 index, u8 *color);

void vector_slot_negate_store(const s32 *vector, u8 *color, u32 slot,
                              u32 active)
{
    u32 saved_slot = slot;
    u32 saved_active = (u8)active;
    u32 slot_index;
    u32 offset;
    u32 post_index;
    u32 post_offset;

    if (saved_active != 0) {
        const volatile s32 *saved_vector = vector;
        slot_index = (u8)saved_slot;
        offset = slot_index << 2;
        offset += slot_index;
        offset <<= 3;
        *(volatile s32 *)(D_80078300 + offset) = -saved_vector[0];
        *(volatile s32 *)(D_80078304 + offset) = -saved_vector[2];
        *(volatile s32 *)(D_80078308 + offset) = -saved_vector[1];
        func_8000E05C((u8)slot_index, color);
    }
    post_index = (u8)saved_slot;
    post_offset = post_index << 2;
    post_offset += post_index;
    post_offset <<= 3;
    *(u32 *)(D_80078320 + post_offset) = saved_active;
}
