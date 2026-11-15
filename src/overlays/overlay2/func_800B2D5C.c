#include "types.h"

#define FIELD(expr, type, offset) (*(type *)((u8 *)(expr) + (offset)))

extern s32 func_8000D834();
extern s32 func_80016FC4();
extern s32 func_80017C24();
extern s32 func_80024E9C();
extern s32 func_80032F3C();
extern s32 func_80035F88();
extern s32 func_80092B98();
extern s32 func_800D57CC();
extern s32 func_800D5D28();
extern s32 func_800D628C();
extern void *func_800DD634();
extern s32 func_800DD788();

extern u16 D_80084F40;
extern void *D_80087938;
extern u16 D_800892B4;
extern s32 D_8008931C;
extern void *D_800C3A18;
extern void *D_800C3A20;
extern u16 D_800C4EE0;
extern u16 D_800C5CD8;

void func_800B2D5C(s32 arg0) {
    s32 value;
    void *state;

    func_80032F3C(0);
    state = func_800DD634();
    D_800892B4 = D_800C5CD8;
    func_80017C24(FIELD(D_80087938, s32, 0x50));
    value = FIELD(D_80087938, s32, 0x38);
    if (value != 0) {
        func_8000D834(D_8008931C, value);
    }
    FIELD(state, s32, 0x40) = 0;
    FIELD(state, s32, 0x44) = 0;
    FIELD(state, s32, 0x48) = 0;
    func_80092B98();
    func_80092B98();
    func_80092B98();
    func_80035F88(D_80084F40, FIELD(D_80087938, s32, 0x28));
    func_80032F3C(0, D_80087938);
    func_80016FC4(D_800C4EE0);
    func_800D5D28(arg0);
    func_800D628C(arg0);
    func_800DD788(0x12);
    func_80024E9C();
    func_800D57CC();
    func_80032F3C(0, D_800C3A18);
    func_80032F3C(0, D_800C3A20);
    FIELD(state, s32, 0x24) = 0;
    FIELD(state, s32, 0x28) = 0;
    FIELD(state, s32, 0x2C) = 0;
    FIELD(state, s32, 0x30) = 0;
}
