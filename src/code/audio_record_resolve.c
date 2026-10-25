#include "types.h"

extern void *D_80086DD8;
extern u8 D_800908B8[];
extern u8 D_800C5098[];
extern u8 D_80002980[];
extern u8 *func_80037108(void *resource, s32 mode);
extern u32 func_80036E1C(void *record);

u32 audio_record_resolve(s32 index)
{
    register s32 saved_index __asm__("$16") = index;
    register u8 *state __asm__("$5");
    register s32 channel __asm__("$2");
    register u8 *base __asm__("$3");
    register s32 record_index __asm__("$2");
    register s32 offset __asm__("$4");

    if (D_80086DD8 == D_800908B8) {
        state = D_800C5098;
    } else {
        state = func_80037108(D_80002980, 1);
    }
    channel = *(s8 *)(state + 4);
    channel *= 90;
    channel += 0x42;
    base = state + channel;
    __asm__ volatile ("" : "=r" (base) : "0" (base));
    record_index = (s16)saved_index;
    offset = record_index * 6;
    __asm__ volatile ("" : : "r" (saved_index));
    return func_80036E1C(base + offset);
}
