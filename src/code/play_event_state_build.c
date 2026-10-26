#include "types.h"

typedef struct PlayEventContext {
    u8 pad00[0x1E];
    u8 team;
    u8 player;
} PlayEventContext;

extern u8 D_800892A4;
extern u8 D_800892A5;
extern u8 D_800892A6;
extern u8 D_800892A7;
extern void team_event_append(u32 team, u32 first, u32 second, u32 value);
extern void team_event_append_secondary(u32 team, u32 first, u32 second,
                                        u32 value);
extern void func_80025944(u32 team, u32 kind, u32 value);
extern u8 func_800297FC(PlayEventContext *context);

void play_event_state_build(PlayEventContext *context, u32 value)
{
    register PlayEventContext *saved_context __asm__("$17") = context;
    register u32 saved_value __asm__("$18") = value;
    register s32 signed_value __asm__("$16");

    __asm__("" : "=r"(saved_context), "=r"(saved_value)
            : "0"(saved_context), "1"(saved_value));
    team_event_append(saved_context->team, saved_context->player, 9, 1);
    signed_value = (s16)saved_value;
    team_event_append(saved_context->team, saved_context->player, 10,
                      signed_value);
    team_event_append_secondary(saved_context->team, saved_context->player,
                                42, signed_value);
    func_80025944(saved_context->team, 2, signed_value);
    func_80025944(saved_context->team, 0, signed_value);
    func_80025944(saved_context->team, 10, signed_value);
    D_800892A4 = 1;
    D_800892A5 = saved_value;
    D_800892A6 = func_800297FC(saved_context);
    D_800892A7 = 0xFF;
}
