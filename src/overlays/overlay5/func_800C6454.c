#include "types.h"

typedef struct StateC6454 {
    u8 pad00[0x50];
    u16 first_id;
    u16 second_id;
    u16 pad54;
    u16 mode;
} StateC6454;

s32 func_800C6318(void);
s32 func_800C61B8(s32 value);
s32 func_800C63A8(s32 value);
s32 func_80022538(u32 team, u32 roster, s32 first, s32 second);
s32 func_80022638(u32 team, u32 roster, s32 value, u32 occurrence);

s32 func_800C6454(StateC6454 *state, s16 value) {
    s32 result;
    s32 shifted;
    s32 signed_result;
    u8 unused[8];

    if (state->mode != 0) {
        if (state->mode == 1) {
            result = func_800C6318();
        } else {
            result = func_800C61B8(value);
        }
        shifted = result << 16;
        signed_result = shifted >> 16;
        if (shifted < 0) {
            result = func_80022538(state->second_id, 3, result & 0x7FFF, 1);
        } else {
            result = func_80022538(state->second_id, 16, signed_result, 0);
        }
    } else {
        result = func_800C63A8(value);
        result = func_80022638(state->first_id, 6, (s16)result, 0);
    }
    return (s16)result;
}
