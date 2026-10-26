#include "types.h"

extern u16 D_80080CFC[][0x10A6];
extern s16 func_8002C5E4(u32 team, u32 player, u16 value);

s32 team_player_pair_update(u32 team_arg, u32 player_arg, u32 second_arg,
                            u32 first_arg)
{
    register u16 team __asm__("$16");
    register u32 player __asm__("$18");
    register u32 second __asm__("$19") = second_arg;
    register s32 first __asm__("$17");
    register u16 (*table)[0x10A6] __asm__("$4");
    register s32 table_offset __asm__("$2");
    register s32 value __asm__("$4");
    register s32 quotient __asm__("$2");

    team = team_arg;
    table_offset = team * sizeof(D_80080CFC[0]);
    player = player_arg & 0xFFFF;
    __asm__("" : "=r"(table_offset) : "0"(table_offset), "r"(player));
    table = D_80080CFC;
    if (*(u16 *)((u8 *)table + table_offset + player * 2) == 0xFFFF) {
        return 0x8000;
    }
    first = func_8002C5E4(team, player, first_arg);
    if (first == 0) {
        __asm__("" : "=r"(first));
        return 0;
    }
    value = func_8002C5E4(team, player, second) * 10;
    value /= first;
    quotient = value / 10;
    value -= quotient * 10;
    value &= 0xFFFF;
    __asm__("" : "=r"(value) : "0"(value));
    return (quotient << 16) | value;
}
