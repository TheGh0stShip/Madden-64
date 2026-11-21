#include "types.h"

typedef struct {
    u8 pad0[0xE];
    u8 unk_E;
    u8 padF[0x15];
    u8 unk_24;
    u8 unk_25;
} TeamInfo;

typedef struct {
    u8 pad0[0xF0];
    char unk_F0[0x14];
    char unk_104[0x48];
    u8 unk_14C;
    u8 pad14D[0x5];
    u8 unk_152;
    u8 unk_153;
    TeamInfo *unk_154;
    TeamInfo *unk_158;
} Matchup;

typedef struct {
    u8 pad0[0x8];
    u8 unk_8[0x10];
    u8 unk_18[0x10];
} Labels;

typedef struct {
    u8 pad0[0x74];
    Labels unk_74;
} Panel;

typedef struct {
    u8 pad0[0x48];
    s32 unk_48;
    u8 pad4C[0x4];
    s32 unk_50;
} State;

extern s16 D_800E7A90;
extern s16 D_800E7A92;
extern s32 D_800C48B8[];
extern char D_800C5A84[];

State *func_800DD634(void);
void func_800D5290(s16, s32);
void func_80092B98(void);
void func_80017C24(s32);
void func_80017B80(s32);
char *func_8002E65C(void *, const void *);
void func_8002AC68(s32, s32, void *, char *);

void func_800B93F4(Matchup *arg0, Panel *arg1) {
    State *state;
    Labels *labels;
    s16 id;
    s32 first;
    s32 second;

    state = func_800DD634();
    id = (arg0->unk_154->unk_24 << 8) | arg0->unk_154->unk_25;
    D_800E7A90 = id;
    func_800D5290(id, 0);
    id = (arg0->unk_158->unk_24 << 8) | arg0->unk_158->unk_25;
    D_800E7A92 = id;
    func_800D5290(id, 1);
    first = state->unk_48;
    labels = &arg1->unk_74;
    if (first != 0 && state->unk_50 != 0) {
        state->unk_48 = 0;
        second = state->unk_50;
        state->unk_50 = 0;
        func_80092B98();
        func_80092B98();
        func_80017C24(first);
        func_80017C24(second);
    }
    state->unk_48 = D_800C48B8[arg0->unk_152];
    func_80017B80(state->unk_48);
    state->unk_50 = D_800C48B8[arg0->unk_153];
    func_80017B80(state->unk_50);
    func_8002E65C(arg0->unk_F0, arg0->unk_154);
    func_8002E65C(arg0->unk_104, arg0->unk_158);
    func_8002AC68(arg0->unk_154->unk_E & 0x3F, 3, labels->unk_8, &D_800C5A84[arg0->unk_14C * 10]);
    func_8002AC68(arg0->unk_158->unk_E & 0x3F, 3, labels->unk_18, &D_800C5A84[arg0->unk_14C * 10 + 0xEA]);
}
