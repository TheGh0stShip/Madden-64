#include "types.h"

extern s16 D_80086DA8;
extern s8 D_80086DE4[];
extern s8 D_8008B3B2[];
extern s8 D_8008B3B3[];

void display_offsets_accumulate(s8 *x_output, s8 *y_output)
{
    s8 *saved_x_output;
    s32 x;
    s32 y;
    s32 count;
    s32 probe;
    s32 index;

    do {
        saved_x_output = x_output;
    } while (0);
    count = D_80086DA8;
    x = 0;
    y = 0;
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
