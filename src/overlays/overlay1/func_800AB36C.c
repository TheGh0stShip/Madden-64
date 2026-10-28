#include "types.h"

typedef struct {
    u8 pad00[0x98];
    s32 state;
    u8 pad9C[2];
    s16 button;
    s32 unkA0;
} Actor;

extern s32 D_80080C10;

s32 func_80030B54(s16);
void func_800A365C(s32);
void func_800BC5C8(void);
void func_800BC98C(void);

void func_800AB36C(Actor *arg0) {
    if (!(D_80080C10 & 0x10)) {
        func_800BC5C8();
    }
    arg0->unkA0 = 0;
    switch (arg0->state) {
        case 0:
            if (!(func_80030B54(arg0->button) & 0x2020)) {
                arg0->state = 2;
            }
            break;
        case 1:
            if (!(func_80030B54(arg0->button) & 0x10)) {
                arg0->state = 2;
            }
            break;
        case 2:
            if (D_80080C10 & 0x10) {
                func_800BC98C();
            }
            func_800A365C(0);
            break;
    }
}
