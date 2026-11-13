#include "types.h"

extern void *D_80086DD8;
extern u8 D_800908B8[];
extern u8 D_800C5098[];
extern u8 D_80002980[];
extern u8 *func_80037108(void *resource, s32 mode);
extern u32 func_80036E1C(void *record, void *state);

u32 audio_record_resolve(s32 index)
{
    s32 saved_index = index;
    u8 *state;
    s32 channel;
    u8 *base;
    s32 record_index;
    s32 offset;

    if (D_80086DD8 == D_800908B8) {
        state = D_800C5098;
    } else {
        state = func_80037108(D_80002980, 1);
    }
    channel = *(s8 *)(state + 4);
    channel *= 90;
    channel += 0x42;
    base = state + channel;
    record_index = (s16)saved_index;
    offset = record_index * 6;
    return func_80036E1C(base + offset, state);
}
