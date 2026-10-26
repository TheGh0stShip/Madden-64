#include "types.h"

extern s32 func_8002C5E4(u32 team, u32 player, s32 field);
extern void func_80027EF0(s32 first, s32 second, s32 third, s32 fourth,
                         s32 fifth);

void team_color_resolve(u32 team_arg, u32 player_arg)
{
    register u32 team __asm__("$18");
    u32 player;
    s32 first;
    s32 second;
    s32 third;
    s32 fourth;
    s32 fifth;

    team = team_arg & 0xFFFF;
    player = player_arg & 0xFFFF;
    first = func_8002C5E4(team, player, 3);
    first = (s16)first;
    second = func_8002C5E4(team, player, 4);
    second = (s16)second;
    third = func_8002C5E4(team, player, 5);
    third = (s16)third;
    fourth = func_8002C5E4(team, player, 6);
    fourth = (s16)fourth;
    fifth = (s16)func_8002C5E4(team, player, 7);
    func_80027EF0(first, second, third, fourth, fifth);
}
