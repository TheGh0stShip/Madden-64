#include "types.h"

typedef struct {
    u16 mode;
    u8 pad02[0x16];
    s16 unk18;
} GameState;

extern GameState D_8006B7A8;
extern s8 D_80088098;

void func_8000BE80(void);
void func_800334B8(void);
void func_800A7AB0(void);
void func_800A80E4(void);
void func_800B0F38(s16);

void func_800AC744(void) {
    GameState *state = &D_8006B7A8;
    u16 mode = 3;
    s8 flag = 1;

    do {
        func_800A80E4();
        func_8000BE80();
        func_800334B8();
    } while (state->mode != 0);
    state->mode = mode;
    D_80088098 = flag;
    func_800B0F38(state->unk18);
    if (D_8006B7A8.mode == 4) {
        D_8006B7A8.mode = 0;
        return;
    }
    do {
        func_8000BE80();
        func_800334B8();
        func_800A7AB0();
    } while (D_8006B7A8.mode != 2);
}
