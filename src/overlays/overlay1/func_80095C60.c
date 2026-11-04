#include "types.h"

typedef struct {
    u8 pad0[8];
    s32 timer;
} State95C60;

extern void func_800AADA8(s16);
extern void func_8002FF70(State95C60 *);
extern void func_800AEA9C(s32);
extern void func_800AE700(void);
extern s32 D_8006B970;
extern s32 D_8006B974;
extern s32 D_8006B978;
extern s16 D_80086BE4;
extern s8 D_80087AF2;
extern u16 D_8008A5B4;

void func_80095C60(State95C60 *state) {
    if (D_80087AF2 == 0) {
        state->timer = D_8008A5B4 + state->timer;
        if (state->timer >= 0x1E1) {
            func_800AADA8(D_80086BE4);
            func_8002FF70(state);
            func_800AEA9C(0);
            func_800AE700();
            D_8006B974 = 0;
            D_8006B970 = 0;
            D_8006B978 = 0;
        }
    }
}
