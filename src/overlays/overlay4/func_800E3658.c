#include "types.h"

typedef struct {
    u8 pad0000[0x20C0];
    u8 *events;
    u8 pad20C4[0x214C - 0x20C4];
} Team;

extern Team D_80080CFC[];
extern s8 D_80072C1C[];

s16 func_800E3658(u16 team, u16 period, u16 code, u16 occurrence, u8 *out) {
    u8 *events;
    u8 *cursor;
    u16 entry;
    u16 count;
    u8 head;
    s8 j;

    events = D_80080CFC[team].events;
    count = -1;
    if (*events & 0x80) {
        cursor = events + 6;
        entry = 0;
        do {
            *out = 0;
            do {
                head = *cursor;
                *out = head & 0x7F;
                cursor++;
                for (j = 0; j < D_80072C1C[*out]; j++) {
                    *(j + out + 1) = *cursor;
                    cursor++;
                }
                if (entry == period && *out == code) {
                    if (++count == occurrence) {
                        goto next;
                    }
                }
                *out = head;
            } while (!(head & 0x80));
next:
            entry++;
        } while (entry <= period);
        *out &= 0x7F;
    }
    if (count < occurrence) {
        count = -1;
    }
    return count;
}
