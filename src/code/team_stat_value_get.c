#include "types.h"

extern u16 D_80080CFC;
extern s16 D_80081876;
extern u16 D_8006B9D8;
extern s16 func_80023F94(u16 player, u16 stat);
extern s16 func_8002836C(u16 player, u16 stat);

s16 team_stat_value_get(u32 team, u32 index, u32 stat)
{
    register s32 team_offset __asm__("$8");
    register s32 product __asm__("$2");
    s32 index_offset;
    register u8 *base __asm__("$9");
    register u8 *address __asm__("$2");
    register u16 player __asm__("$4");
    register u32 saved_stat __asm__("$7");

    team = (u16)team;
    product = team * 2131;
    __asm__("" : "=r"(product) : "0"(product));
    team_offset = product * 4;
    __asm__("" : "=r"(team_offset) : "0"(team_offset));
    index = (u16)index;
    __asm__("" : "=r"(index) : "0"(index));
    base = (u8 *)&D_80080CFC;
    index_offset = index * 2;
    __asm__("" : "=r"(base) : "0"(base), "r"(index_offset));
    address = (u8 *)(team_offset + (u32)base);
    address = (u8 *)(index_offset + (u32)address);
    player = *(u16 *)address;
    saved_stat = stat;
    if (player == 0xFFFF) {
        return -0x8000;
    }
    if (D_8006B9D8 == 0) {
        address = base + 0xB7A;
        index_offset = index * 3;
        index_offset *= 16;
        index_offset -= index;
        index_offset *= 2;
        address = (u8 *)(team_offset + (u32)address);
        index_offset += (u32)address;
        address = (u8 *)((u16)saved_stat * 2);
        address += index_offset;
        return *(s16 *)address;
    }
    if ((u16)(stat - 33) < 6) {
        return func_8002836C(player, (u16)saved_stat);
    }
    return func_80023F94(player, (u16)saved_stat);
}
