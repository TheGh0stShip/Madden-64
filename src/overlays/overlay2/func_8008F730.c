#include "types.h"

typedef struct {
    volatile u8 count;
    u8 pad01[0x9C1];
    s16 lists[2][0x75];
} Roster;

extern Roster D_800C509C;
extern s16 D_800C5C34;

void func_8008F730(void) {
    u8 c = D_800C509C.count;

    if ((s8)c >= 1 && (s8)c <= 17) {
        u8 d;
        s16 v = (s8)c;

        D_800C509C.lists[0][(s8)c] = v;
        d = D_800C509C.count;
        v = (s8)d + 1;
        D_800C509C.lists[1][(s8)d] = v;
    } else if ((s8)c >= 18) {
        D_800C5C34 = (s8)c;
    }
}
