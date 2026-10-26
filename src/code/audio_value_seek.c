#include "types.h"

extern s16 audio_range_value_get(s16 range, s16 value);

s16 audio_value_seek(s32 range, s32 value, s32 step)
{
    register s32 input_step __asm__("$6") = step;
    register s32 saved_step __asm__("$19") = input_step;
    register s32 position __asm__("$16") = value + input_step;
    register s32 saved_range __asm__("$18") = range << 16;
    register s32 shifted_step __asm__("$6");
    register s32 direction __asm__("$17");
    s32 next;

    __asm__("" : "=r"(saved_step) : "0"(saved_step));
    __asm__("" : "=r"(position) : "0"(position));
    shifted_step = input_step << 16;
    direction = shifted_step >> 16;

    for (;;) {
        if (audio_range_value_get((s16)(saved_range >> 16),
                                  (s16)position) != 0) {
            break;
        }
        next = position + saved_step;
        position = next;
        if (direction > 0) {
            if ((s16)next >= 100) {
                position = 1;
            }
        } else if ((s16)next <= 0) {
            position = 99;
        }
    }
    return (s16)position;
}
