#include "types.h"

typedef struct {
    s8 scored;
    s8 allowed;
    u8 rest[12];
} Entry14;

extern Entry14 D_800C5896[];
s16 func_80023F94(u16 owner, u16 code);
u8 func_80024B90(u16 id);
u16 frame_identifier_find(u32 identifier);
s32 func_8008F7A4(s32 team, u32 first, u32 last);

s32 gameplay_selection_finalize(u16 id)
{
    s32 total;

    total = func_80023F94(id, 6) * 3;
    total += func_80023F94(id, 11) * 6;
    total += func_80023F94(id, 15) * 3;
    total += func_80023F94(id, 20) * 3;
    total += func_80023F94(id, 22) * 3;
    total += func_80023F94(id, 17) * 3;
    total += func_80023F94(id, 16);
    total += func_80023F94(id, 24) * 3;
    total += func_80023F94(id, 31) * 2;
    total += (s16)(func_80023F94(id, 5) / 50);
    total += (s16)(func_80023F94(id, 10) / 25);
    total += (s16)(func_80023F94(id, 14) / 25);
    if (func_80024B90(id) != 0xFF) {
        total += D_800C5896[frame_identifier_find(func_80024B90(id))].scored * 4;
        total += func_8008F7A4(frame_identifier_find(func_80024B90(id)), 17, 19) * 5;
    }
    if (total < 0) {
        total = 0;
    }
    return total;
}
