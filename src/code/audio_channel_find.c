#include "types.h"

static __inline__ s32 state_offset_add(s32 state, s32 offset) {
    return state + offset;
}

s32 audio_channel_find(const u8 *key, const u8 *state)
{
    s16 index = 0;
    s32 channel = *(const s8 *)(state + 4);
    u32 target = key[0];
    s32 channel_offset = channel * 90;
    s32 result;

    do {
        s32 offset = index * 6;

        offset = offset + channel_offset;
        offset = state_offset_add((s32)state, offset);
        if (*(u8 *)(offset + 0x42) != target) {
            index++;
            continue;
        }
        result = index;
        goto done;
    } while (index < 15);
    result = 0;
done:
    return result;
}
