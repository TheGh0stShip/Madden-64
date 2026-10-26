#include "types.h"

extern u8 D_800892A4[];
extern u8 D_80088AF8;
extern u8 D_80088AF9[];
extern u8 D_80088AFA;
extern u8 D_80088AFB[];

void play_event_queue_advance(void)
{
    register u32 index __asm__("$5");
    register u32 position __asm__("$4");
    register u32 narrowed __asm__("$3");
    register u8 *write_pointer __asm__("$6");

    if (D_800892A4[0] == 0) {
        return;
    }
    write_pointer = D_80088AF9;
    position = *write_pointer;
    __asm__("" : "=r"(position) : "0"(position));
    narrowed = position & 0xFF;
    if (narrowed < 30) {
        register u32 next __asm__("$2") = position + 1;
        index = narrowed;
        *write_pointer = next;
    } else {
        register u32 loaded __asm__("$2") = D_80088AFA;
        __asm__("" : "=r"(loaded) : "0"(loaded));
        index = loaded;
        position = index + 1;
        D_80088AF8 += D_80088AFB[index * 4 + 1];
        D_80088AFA = (s32)position % 30;
    }
    narrowed = index << 2;
    __builtin_memcpy(D_80088AFB + narrowed, D_800892A4, 4);
    D_800892A4[0] = 0;
}
