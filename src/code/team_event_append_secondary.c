#include "types.h"

extern s16 D_80089320;
extern s16 D_80082CA8;

void team_event_append_secondary(u32 team, u32 first, u32 second, u32 value)
{
    u32 team_index;
    register u32 offset __asm__("$3");
    register s32 kind __asm__("$3");
    register s32 test __asm__("$2");
    s32 count;
    u32 event_offset;

    if (D_80089320 != 0) {
        goto store;
    }
    kind = (u16)second;
    test = kind < 29;
    __asm__("" : "=r"(test) : "0"(test));
    if (test == 0) {
        return;
    }
    test = kind < 26;
    __asm__("" : "=r"(test) : "0"(test));
    if (test != 0) {
        return;
    }
store:
    team_index = (u16)team;
    offset = team_index * 8524;
    count = *(s16 *)(offset + (u32)&D_80082CA8);
    if (count < 30) {
        event_offset = count * 4 + offset;
        *(volatile u8 *)(event_offset + (u32)&D_80082CA8 + 2) = first;
        event_offset = *(s16 *)(offset + (u32)&D_80082CA8) * 4 + offset;
        *(volatile u8 *)(event_offset + (u32)&D_80082CA8 + 3) = second;
        event_offset = *(s16 *)(offset + (u32)&D_80082CA8) * 4 + offset;
        *(volatile u16 *)(event_offset + (u32)&D_80082CA8 + 4) = value;
        count = *(volatile u16 *)(offset + (u32)&D_80082CA8);
        *(volatile u16 *)(offset + (u32)&D_80082CA8) = count + 1;
    }
}
