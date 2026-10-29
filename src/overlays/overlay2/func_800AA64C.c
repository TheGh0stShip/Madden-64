#include "types.h"

typedef struct {
    u8 pad00[0x14];
    s32 unk14;
    s32 unk18;
    u8 pad1C[0x24];
    s32 unk40[6];
} State;

extern s32 D_800C3A10;
extern u16 D_800C3A1C;
extern s32 D_800C504C;

State *func_800DD634(void);
void func_8000BE80(State *);
void func_8000DA98(s32);
void func_800D628C(s32);
void func_80016FC4(u16);

void func_800AA64C(s32 arg0) {
    State *state;
    s8 i;

    state = func_800DD634();
    for (i = 1; i < 6; i++) {
        state->unk40[i] = 0;
    }
    state->unk14 = 0;
    state->unk18 = 0;
    func_8000BE80(state);
    func_8000DA98(D_800C3A10);
    func_8000DA98(D_800C504C);
    func_800D628C(arg0);
    func_80016FC4(D_800C3A1C);
}
