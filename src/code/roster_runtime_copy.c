#include "types.h"

extern u8 D_80080C90[];
extern u16 D_80080CFC[];
extern u8 D_80080D78[];
extern u16 *D_80073438;
extern u16 func_80028A58(u8 value);
extern u8 *func_8003A368(void);

void roster_runtime_copy(u32 roster)
{
    register u32 offset __asm__("$17");
    register u32 record_offset __asm__("$16");
    register u16 *source __asm__("$19");
    register u16 *destination __asm__("$18");
    register u8 *output __asm__("$4");
    register u32 v1_work __asm__("$3");
    register u32 v0_work __asm__("$2");
    u32 record;

    roster &= 0xFFFF;
    offset = roster * 0x214C;
    record = func_80028A58(D_80080C90[offset]);
    v1_work = (u32)D_80080CFC;
    source = (u16 *)(offset + v1_work);
    record &= 0xFFFF;
    record_offset = record << 3;
    record_offset -= record;
    record_offset <<= 3;
    v1_work = (u32)D_80073438;
    __asm__("" : "=r"(v1_work) : "0"(v1_work));
    record_offset -= record;
    v0_work = record_offset << 1;
    destination = (u16 *)(v1_work + v0_work);
    output = func_8003A368() + record_offset;
    v1_work = 0;
    do {
        *destination++ = *source++;
        *output++ = D_80080D78[offset];
        offset += 0x28;
        v1_work++;
    } while (v1_work < 55);
}
