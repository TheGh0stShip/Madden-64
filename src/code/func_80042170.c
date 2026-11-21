#include "types.h"

void func_80042170(u8 *bitmap, u8 frame, u8 *output, u8 stride, u8 bottom, u8 x, u8 y) {
    s32 row;
    s32 top;
    s32 end;
    u8 *source;
    u8 *dest;
    s32 col;
    s32 bit;

    source = bitmap + 2 + frame * bitmap[0] * bitmap[1];
    top = bottom - y - 1;
    end = top - bitmap[0];
    for (row = top; end < row; row--) {
        dest = output + row * stride + x;
        for (col = 0; col < bitmap[1]; col++) {
            for (bit = 7; bit >= 0; bit--) {
                if ((source[col] >> bit) & 1) {
                    *dest = 1;
                }
                dest++;
            }
        }
        source += bitmap[1];
    }
}
