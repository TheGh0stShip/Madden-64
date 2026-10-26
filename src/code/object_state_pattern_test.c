#include "types.h"

s32 object_state_pattern_test(u8 *object)
{
    u8 *state;

    if (*(s32 *)(object + 0x4C) != 0) return 0;
    if (*(s32 *)(object + 0x12C) != 0) return 0;
    if (*(s32 *)(object + 0x24) != 3) return 0;
    if (*(s32 *)(object + 0x20) != *(s32 *)(object + 0x24)) return 0;
    if (*(s32 *)(object + 0x28) != 2) return 0;
    if (*(s32 *)(object + 0x78) != *(s32 *)(object + 0x20)) return 0;

    state = *(u8 **)(object + 0xD8);
    if (*(s32 *)(state + 8) != *(s32 *)(object + 0x28)) return 0;
    if (*(s32 *)(state + 0x5C) != 1) return 0;
    if (*(s32 *)(state + 0xB0) != *(s32 *)(state + 0x5C)) return 0;
    if (*(s32 *)(state + 0x0C) >= 3) return 0;
    if (*(s32 *)(state + 0x60) != *(s32 *)(state + 0xB0)) return 0;
    if (*(s32 *)(state + 0xB4) != *(s32 *)(state + 0x60)) return 0;
    if (*(s32 *)(state + 0x24) != *(s32 *)(object + 0x138)) return 0;
    if (*(s32 *)(state + 0x78) != *(s32 *)(state + 0x24)) return 0;
    if (*(s32 *)(state + 0xCC) != *(s32 *)(state + 0x78)) goto no_match;
    __asm__ volatile("");
    return 1;
no_match:
    return 0;
}
