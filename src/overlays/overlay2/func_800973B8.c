#include "types.h"
typedef struct { u8 head[4]; char names[8][13]; u8 used[8]; u8 rest[0x39C]; } Table;
extern Table D_800C4AD0;
u16 func_80031A1C(s32);
void func_8002E65C(char *, char *);

void func_800973B8(void) {
    s8 order[4];
    Table copy;
    s32 i;
    s8 none = -1;
    s8 next;
    u16 pick;

    for (i = 3; i >= 0; i--) {
        order[i] = none;
    }
    next = 0;
retry:
    pick = func_80031A1C(4);
    if (order[pick] == -1) {
        order[pick] = next;
        next++;
    }
    for (i = 0; i < 4; i++) {
        if (order[i] == -1) {
            goto retry;
        }
    }
    copy = D_800C4AD0;
    for (i = 0; i < 4; i++) {
        func_8002E65C(D_800C4AD0.names[i], copy.names[order[i]]);
        D_800C4AD0.used[i] = copy.used[order[i]];
    }
}
