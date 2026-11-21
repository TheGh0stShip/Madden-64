#include "types.h"

typedef struct FontMetrics {
    u8 pad00[2];
    s16 line_height;
    u8 pad04[2];
    s16 rows;
    u16 width;
    u8 pad0A[2];
    s16 column_widths[96];
    u8 *data;
    u8 padD0[8];
} FontMetrics;

extern FontMetrics D_80088B78[];

s16 resource_stream_process(s16 first, s16 second, s16 font)
{
    u8 *left;
    u8 *right;
    u8 *p;
    u8 c;
    s16 best;
    s16 i;
    s16 a;
    s16 b;
    s32 half;

    if (first > 0 && second > 0) {
        half = (s16)D_80088B78[font].width / 2;
        best = (s16)D_80088B78[font].width * 2;
        left = D_80088B78[font].data + (first - 1) * half;
        right = D_80088B78[font].data + (second - 1) * half;
        for (i = 0; i < D_80088B78[font].rows; i++) {
            p = left + ((D_80088B78[font].column_widths[first] + 1) / 2 - 1);
            c = *p;
            b = 0;
            a = 0;
            while ((c & 0xF) < 7 && (c & 0xF0) < 0x61 && left < p) {
                p--;
                c = *p;
                a += 2;
            }
            if ((*p & 0xF0) < 0x61) {
                a++;
            }
            if (D_80088B78[font].column_widths[first] & 1) {
                a--;
            }
            c = *right;
            p = right;
            if ((c & 0xF) < 7) {
                while ((c & 0xF0) < 0x61 &&
                       p < right + (D_80088B78[font].column_widths[second] + 1) / 2) {
                    p++;
                    c = *p;
                    b += 2;
                    if ((c & 0xF) >= 7) {
                        goto next;
                    }
                }
                if ((*p & 0xF) < 7) {
                    b++;
                }
            }
        next:
            if (a + b < best) {
                best = a + b;
            }
            left += (s16)D_80088B78[font].width / 2 * D_80088B78[font].line_height;
            right += (s16)D_80088B78[font].width / 2 * D_80088B78[font].line_height;
        }
        best--;
    } else {
        best = 0;
    }
    return best;
}
