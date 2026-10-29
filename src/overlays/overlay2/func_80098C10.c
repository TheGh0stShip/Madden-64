#include "types.h"

typedef struct {
    u8 pad[0x30];
    s32 unk30;
    u8 pad34[0x1C];
    s32 unk50;
} Team;

typedef struct {
    u8 pad[0x44];
    s32 unk44;
    s32 unk48;
} State;

extern Team *D_80087938;
extern s16 D_800892B4;
extern s32 D_800C48B8[];
extern u8 D_80071A28[];
extern u16 D_800C391C[];

State *func_800DD634(void);
void func_80092B98(void);
void func_80017C24(s32);
void func_80017B80(s32);

void func_80098C10(s32 index) {
    State *state = func_800DD634();

    state->unk44 = 0;
    state->unk48 = 0;
    func_80092B98();
    func_80092B98();
    func_80092B98();
    func_80017C24(D_80087938->unk50);
    D_80087938->unk50 = D_800C48B8[index];
    *(s32 *)((u8 *)D_80087938 + 0x30) = D_800C391C[D_80071A28[index]];
    D_800892B4 = index;
    func_80017B80(*(s32 *)((u8 *)D_80087938 + 0x50));
    state->unk48 = D_80087938->unk50;
}
