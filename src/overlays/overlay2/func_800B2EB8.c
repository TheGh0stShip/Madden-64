#include "types.h"

typedef struct {
    s32 ids[200];
    s16 count;
} Roster;

typedef struct {
    char text[33];
} Text33;

extern u16 D_8006B9E4[];
extern char D_8006BFA0[];
extern Text33 D_8008C07C;
extern s32 *D_800C505C;
extern Roster *D_800C5094;

char *func_8003A7B8(u16);
void func_8002E65C(char *, char *);
void func_800D3214(s32 *, s16, char *, s32);

void func_800B2EB8(u32 index, s32 mode, char *text) {
    Roster *roster = D_800C5094;
    s16 count = roster->count;

    if (index < count) {
        if (mode == 0) {
            func_8002E65C(text, func_8003A7B8(D_8006B9E4[roster->ids[index]]) + 1);
        } else {
            func_800D3214(&D_800C505C[mode * 2 + 1], roster->ids[index], text, mode);
        }
    } else if (count == 0 && index == 0 && mode == 0) {
        *(Text33 *)text = D_8008C07C;
    } else {
        func_8002E65C(text, D_8006BFA0);
    }
}
