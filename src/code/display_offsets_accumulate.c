#include "types.h"

extern s16 D_80086DA8;
extern s8 D_80086DE4[];
extern s8 D_8008B3B2[];
extern s8 D_8008B3B3[];

void display_offsets_accumulate(s8 *x_output, s8 *y_output)
{
    register s8 *saved_x_output __asm__("$9");
    register s32 x __asm__("$7");
    register s32 y __asm__("$8");
    register s32 count __asm__("$4");
    register s32 probe __asm__("$2");
    register s32 index __asm__("$6");

    saved_x_output = x_output;
    count = D_80086DA8;
    __asm__("" : "=r"(count) : "0"(count), "r"(saved_x_output));
    x = 0;
    y = 0;
    __asm__("" : "=r"(y) : "0"(y), "r"(x));
    probe = count;
    count--;
    if (probe != 0) {
        index = count;
        do {
            s32 offset = D_80086DE4[index] * 6;
            x += D_8008B3B2[offset];
            y += D_8008B3B3[offset];
        } while (index-- != 0);
    }
    if (x < -80) {
        x = -80;
    }
    if (x >= 81) {
        x = 80;
    }
    if (y < -80) {
        y = -80;
    }
    if (y >= 81) {
        y = 80;
    }
    *saved_x_output = x;
    *y_output = y;
}
