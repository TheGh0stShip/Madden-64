#include "types.h"

extern u8 D_80081860[];
extern u16 func_800397C8(u16 row, u16 column);

u32 roster_value_resolve(const u8 *record)
{
    u32 current = (u32)record;
    u8 *base;
    u32 team;
    u32 team_offset;
    u32 result;

    if (current != 0) {
        goto lookup;
    }
    result = 0;
    goto done;
lookup:
    team = ((u8 *)current)[0x1E];
    current = ((u8 *)current)[0x1F];
    base = D_80081860;
    team_offset = team * 8524;
    result = func_800397C8(team,
        *(u16 *)(base + team_offset + current * 2));
    result &= 0xFFFF;
done:
    return result;
}
