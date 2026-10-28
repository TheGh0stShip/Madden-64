#include "types.h"

typedef s32 (*ObjectCallback)(u8 *object);

s32 object_output_reset(u8 *object)
{
    u8 *saved_object = object;
    u8 *state = *(u8 **)(saved_object + 0x1B8);
    s32 delta = *(s32 *)(state + 0xC);
    u8 *owner = *(u8 **)(saved_object + 0x1B4);
    s32 index;
    u32 final_value;
    s32 result;
    volatile u64 unused;

    if (delta < 0) {
        delta += 7;
    }
    *(s32 *)(owner + 0x5C) += delta >> 3;
    *(s32 *)(state + 0xC) = 0;
    if (((ObjectCallback)*(u32 *)(*(u8 **)(saved_object + 0x1B4) + 8))
        (saved_object) == 0) {
        return 0;
    }
    if (*(s32 *)(saved_object + 0x144) > 0) {
        index = 0;
        owner = state;
        do {
            *(u32 *)(owner + 0x14) = 0;
            index++;
            owner += 4;
        } while (index < *(s32 *)(saved_object + 0x144));
    }
    final_value = *(u32 *)(saved_object + 0x114);
    result = 1;
    *(u32 *)(state + 0x10) = 0;
    *(u32 *)(state + 0x24) = final_value;
    return result;
}
