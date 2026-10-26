#include "types.h"

extern s32 func_80023F94(u16 team, s32 category);
extern void func_80027EF0(s32 first, s32 second, s32 third, s32 fourth,
                          s32 fifth);

void roster_rating_dispatch(u32 team_arg)
{
    u16 team = team_arg;
    s32 first;
    s32 second;
    s32 third;
    s32 fourth;
    s32 fifth;

    first = func_80023F94(team, 3);
    first = (first << 16) >> 16;
    second = func_80023F94(team, 4);
    second = (second << 16) >> 16;
    third = func_80023F94(team, 5);
    third = (third << 16) >> 16;
    fourth = func_80023F94(team, 6);
    fourth = (fourth << 16) >> 16;
    fifth = func_80023F94(team, 7);
    fifth = (fifth << 16) >> 16;
    func_80027EF0(first, second, third, fourth, fifth);
}
