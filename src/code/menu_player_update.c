#include "types.h"

typedef struct MenuQueueEntry {
    s16 player;
    u16 pad2;
    void *first;
    void *second;
    void *third;
    u16 value;
    u16 pad12;
} MenuQueueEntry;

extern s16 func_8001FA38(s32 index);
extern void func_8001FA50(s32 index, s16 value);
extern u16 func_80031A1C(u16 maximum);
extern void func_800A18B4(void *object);
extern void func_800293CC(void);
extern s8 D_80069ED7[];
extern void *D_80069E88[];
extern s16 D_80087A80;
extern u32 D_80080C10;
extern MenuQueueEntry D_8008A740[];
extern s16 D_80088AE4;
extern u8 D_80088AF3;
extern s16 D_80089320;
extern s16 D_800894F8;

s32 menu_player_update(u32 player_arg, void *first_arg, void *second_arg,
                       void *third_arg)
{
    register u32 saved_player __asm__("$18") = player_arg;
    register void *saved_first __asm__("$19") = first_arg;
    register void *saved_second __asm__("$20") = second_arg;
    register void *saved_third __asm__("$21") = third_arg;
    register s32 remaining __asm__("$16");
    register s32 saved_slot __asm__("$5");
    register s32 weighted __asm__("$3");
    u32 player;
    s32 value;
    s32 maximum;
    s32 slot;
    void *player_object;
    u64 stack_padding;

    func_8001FA50(0xD, func_8001FA38(3));
    func_8001FA50(0xE, func_8001FA38(2));
    func_8001FA50(0xF, func_8001FA38(1));
    __asm__("" : : "m"(stack_padding));
    player = saved_player & 0xFFFF;
    remaining = (s16)(8 - func_8001FA38(player));
    if (remaining == 8) {
        return 0;
    }
    value = (s16)func_8001FA38(player);
    maximum = (100 - value * 3) * remaining;
    value = func_80031A1C((u16)maximum);
    weighted = remaining * D_80069ED7[player * 12];
    if (weighted < (u16)value) {
        return 0;
    }
    slot = D_80087A80;
    saved_slot = slot;
    if (slot > 0) {
        goto failed;
    }
    D_8008A740[saved_slot].first = saved_first;
    D_8008A740[saved_slot].second = saved_second;
    D_8008A740[saved_slot].third = saved_third;
    D_8008A740[saved_slot].value = D_80088AE4;
    player_object = D_80069E88[player];
    D_8008A740[saved_slot].player = saved_player;
    D_80087A80 = saved_slot + 1;
    func_800A18B4(player_object);
    if ((D_80080C10 & 1) == 0 &&
        D_80088AF3 != D_80088AE4 &&
        D_80089320 != -1) {
        func_800293CC();
    }
    D_800894F8 = 0;
    return 1;
failed:
    return 0;
}
