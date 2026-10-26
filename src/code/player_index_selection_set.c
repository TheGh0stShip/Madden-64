#include "types.h"

extern u8 D_800785A5[];
extern void *D_80086DD8;
extern u8 D_800908B8[];
extern volatile u16 D_80087954;
extern void func_80044B90(u32 context, u32 player, u32 mode);

void player_index_selection_set(u32 player, u32 selection)
{
    register u32 saved_selection __asm__("$6");
    register u32 player_index __asm__("$5");
    register u32 intermediate __asm__("$2");
    register u32 offset __asm__("$3");
    register u32 current __asm__("$2");
    register u32 selected __asm__("$7");
    register u32 mode __asm__("$6");
    register u32 context __asm__("$4");

    saved_selection = selection;
    __asm__("" : "=r"(saved_selection) : "0"(saved_selection));
    player_index = (u8)player;
    __asm__("" : "=r"(player_index) : "0"(player_index));
    intermediate = player_index << 5;
    intermediate -= player_index;
    intermediate <<= 3;
    intermediate += player_index;
    offset = intermediate << 3;

    current = D_800785A5[offset];
    selected = (u16)saved_selection;
    if (current != selected) {
        D_800785A5[offset] = saved_selection;
        mode = player_index;
        if (D_80086DD8 != D_800908B8) {
            goto normal;
        }
        context = D_80087954;
        mode = player_index < 1;
        goto call;
normal:
        context = D_80087954;
call:
        func_80044B90(context, player_index, mode);
    }
}
