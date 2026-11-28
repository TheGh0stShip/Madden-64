#include "types.h"

typedef struct {
    u8 unk_00[0x2];
    s16 state;
    u8 unk_04[0x2];
    s16 timer;
    u8 unk_08[0x2];
    s16 unk_0A;
    s32 unk_0C;
    u8 unk_10[0x74];
    u16 flags;
} Task;

typedef struct {
    u8 unk_00[0x14];
    s32 flags;
} Owner;

s32 func_8000C8EC(s32);
extern Owner *D_80086C88;
extern s32 D_80088090;
extern Task *D_8008A724[1];
extern void (*D_8006A700[])(Task *);

/* Re-arms the active play task: sets its target/value, resets or starts the mode timer, then dispatches its state handler. */
void func_800A7E28(s32 arg0, s32 arg1, s32 mode) {
    u32 i;

    if (D_80086C88 != 0) {
        D_80086C88->flags |= 1;
    }
    for (i = 0; i < 1; i++) {
        if (D_8008A724[i] != 0) {
            D_8008A724[i]->flags &= ~0x400;
            D_8008A724[i]->unk_0A = arg0;
            D_8008A724[i]->unk_0C = arg1;
            if (mode == 1) {
                D_8008A724[i]->state = 0;
                D_8008A724[i]->timer = 0;
            }
            if (mode == 2) {
                D_8008A724[i]->state = 2;
                if (func_8000C8EC(D_80088090)) {
                    D_8008A724[i]->timer = 0xCFF;
                } else {
                    D_8008A724[i]->timer = 0xCFF;
                }
            }
        }
        D_8006A700[D_8008A724[i]->state](D_8008A724[i]);
    }
}
