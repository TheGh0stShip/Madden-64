#include "types.h"

extern s16 audio_range_value_get(s16 range, s16 value);

s16 audio_value_seek(s32 range, s32 value, s32 step)
{
    s16 saved_range = range;
    s16 saved_step = step;
    s16 position = value + step;
    s16 direction = step;

    for (;;) {
        if (audio_range_value_get(saved_range, position) != 0) {
            break;
        }
        position += saved_step;
        if (direction > 0) {
            if (position >= 100) {
                position = 1;
            }
        } else if (position <= 0) {
            position = 99;
        }
    }
    return position;
}
