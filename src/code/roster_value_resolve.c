#include "types.h"

extern u8 D_80081860[];
extern u16 func_800397C8(u16 row, u16 column);

u32 roster_value_resolve(const u8 *record)
{
    register const u8 *current __asm__("$3") = record;
    register u8 *base __asm__("$5");
    register u32 team __asm__("$4");
    register u32 player __asm__("$3");
    register u32 team_offset __asm__("$2");
    register u32 result __asm__("$2");

    if (current != 0) {
        goto lookup;
    }
    __asm__ volatile ("" : "=r" (current) : "0" (current));
    result = 0;
    goto done;
lookup:
    team = current[0x1E];
    player = current[0x1F];
    __asm__ volatile ("" : "=r" (player) : "0" (player));
    base = D_80081860;
    team_offset = team * 8524;
    __asm__ volatile ("" : "=r" (team_offset) : "0" (team_offset));
    result = func_800397C8(team,
        *(u16 *)(base + team_offset + player * 2));
    result &= 0xFFFF;
    __asm__ volatile ("" : "=r" (result) : "0" (result) : "memory");
done:
    __asm__ volatile ("" : "=r" (result) : "0" (result));
    return result;
}
