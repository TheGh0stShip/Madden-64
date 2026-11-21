#include "types.h"

extern void func_8003D0C4(void *object);
extern void audio_channel_process(void *object, s16 first, s16 second);

void audio_range_render(void *object, s32 unused, s16 level, s32 position) {
    s16 first;
    s16 second;
    s16 scale;
    s16 center;

    func_8003D0C4(object);
    center = 16;
    if ((s16)position != center) {
        scale = level / 16;
        if ((s16)position < center) {
            first = level;
            second = scale * position;
        } else {
            first = scale * (center - (position - center));
            second = level;
        }
    } else {
        first = second = level;
    }
    audio_channel_process(object, first, second);
}
