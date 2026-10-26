#include "types.h"

typedef struct AudioTimelineRecord {
    u32 timestamp;
    u16 flags;
    u16 command;
    s16 first;
    s16 second;
} AudioTimelineRecord;

typedef struct AudioTimelineState {
    u32 time;
    u8 pad04[4];
    AudioTimelineRecord *current;
} AudioTimelineState;

extern AudioTimelineState *D_80074D78;
extern u16 D_8008A5B4;
extern void func_8003CE88(u16 command, s16 first, s16 second);

void audio_timeline_update(void)
{
    AudioTimelineState *timeline = D_80074D78;
    register AudioTimelineRecord *current __asm__("$17");
    register u8 *cursor __asm__("$16");
    register u32 updated_time __asm__("$3");

    if (timeline == 0) {
        return;
    }
    updated_time = D_8008A5B4;
    updated_time += timeline->time;
    timeline->time = updated_time;
    current = timeline->current;
    if (current->flags & 1) {
        return;
    }
    if (timeline->time >= current->timestamp) {
        cursor = (u8 *)current + 4;
        do {
            func_8003CE88(*(u16 *)(cursor + 2),
                          *(s16 *)(cursor + 4),
                          *(s16 *)(cursor + 6));
            cursor += 12;
            {
                u16 flags = *(u16 *)cursor;
                current++;
                if (flags & 1) {
                    break;
                }
            }
        } while (D_80074D78->time >= current->timestamp);
    }
    D_80074D78->current = current;
}
