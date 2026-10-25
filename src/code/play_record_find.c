#include "types.h"

extern u8 D_80080CFC[];

void* audio_frame_record_find(u16 primary, s32 value) {
    register u32 offset __asm__("$2");
    register u8* base __asm__("$3");
    register u16 index __asm__("$6");
    register u8* values __asm__("$4");
    register u8* records __asm__("$7");

    index = 0;
    offset = primary * 8524;
    base = D_80080CFC;
    values = base + offset;
    __asm__ volatile ("" : : "r"(values) : "memory");
    value &= 0xFFFF;
    base += 0x6E;
    records = base + offset;
    while (index < 55) {
        if (*(u16*)(values + index * 2) == value) {
            return records + index * 40;
        }
        index++;
    }
    return 0;
}
