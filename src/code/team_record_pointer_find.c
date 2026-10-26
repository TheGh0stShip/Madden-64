#include "types.h"

extern u8 *D_8006B9DC;
extern u16 func_80028A58(u16 team);

u32 *team_record_pointer_find(u32 team, u32 stat)
{
    register s32 offset __asm__("$6") = 0;
    register s32 count __asm__("$17") = 2;
    register u8 *base_pointer __asm__("$3");
    register s32 base_offset __asm__("$2");
    register u32 *record __asm__("$16");
    s16 index;
    u32 value;

    stat = (u16)stat;
    if ((s32)stat >= 39) goto base;
    if ((s32)stat < 36) goto base;
    offset = 0xF0;
    count = 1;
base:
    base_pointer = D_8006B9DC;
    base_offset = offset + 0x5A9C;
    record = (u32 *)(base_pointer + base_offset);
    record += (u16)func_80028A58((u16)team) * count;
    index = 0;
    if (count != 0) {
        do {
            value = *record;
            if ((value & 0x01FC0000) == 0 ||
                (value & 0x0003FFE0) == 0 ||
                (value & 0xFE000000) == 0xFE000000) {
                break;
            }
            index++;
            record++;
        } while (index < count);
    }
found:
    if (index == count) {
        return 0;
    }
    return record;
}
