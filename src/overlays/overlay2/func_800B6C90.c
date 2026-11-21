#include "types.h"

typedef struct {
    u8 pad0[0x14];
    s32 unk14;
    s32 unk18;
    s32 unk1C;
    s32 unk20;
    u8 pad24[0x20];
    s32 unk44;
} StateB6C90;

typedef struct {
    u8 pad0[0x60];
    u8 unk60;
    u8 unk61;
} TeamB6C90;

typedef struct {
    s16 unk0;
    u16 unk2;
} PairB6C90;

extern void func_80016FC4(u16);
extern void func_80017C24(s32);
extern void func_80032F3C(s32, void *);
extern TeamB6C90 *func_8003A7B8(u16);
extern void func_800D628C(void *);
extern StateB6C90 *func_800DD634(void);

extern PairB6C90 D_800892B4;
extern s16 D_800BDF0C;
extern u16 D_800C3A1C;
extern void *D_800C3A90[][3][22];
extern void *D_800C3CA0[22];
extern u16 D_800C5016;

void func_800B6C90(void *arg0) {
    s16 value;
    StateB6C90 *state;
    TeamB6C90 *team;
    s32 handle;
    s8 i;

    D_800892B4.unk0 = value;
    state = func_800DD634();
    handle = state->unk44;
    state->unk14 = 0;
    state->unk18 = 0;
    state->unk1C = 0;
    state->unk20 = 0;
    state->unk44 = 0;
    func_80017C24(handle);
    team = func_8003A7B8(D_800C5016);
    for (i = 0; i < 22; i++) {
        func_80032F3C(0, D_800C3CA0[i]);
        func_80032F3C(0, D_800C3A90[team->unk60][team->unk61][i]);
    }
    func_800D628C(arg0);
    func_80016FC4(D_800C3A1C);
    D_800BDF0C = (s16)D_800C5016 % 30;
}
