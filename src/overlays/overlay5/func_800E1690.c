#include "types.h"

#define FIELD(expr, type, offset) (*(type *)((u8 *)(expr) + (offset)))

extern s32 func_80032E00();
extern s32 func_80032F3C();
extern s32 func_8004B594();
extern s32 func_800E1F84();
extern s32 func_800E2354();
extern s32 func_800E2438();
extern s32 func_800E2480();
extern s32 func_800E24A0();
extern s16 func_800E25D0();
extern s32 func_800E3714();

extern void *D_80084F28;
extern s16 D_80084F6C;
extern s32 D_80085860;

s16 func_800E1690(void *arg0) {
    s16 result;
    s32 handle;
    u16 zero;
    volatile s32 frame_pad[3];
    void *state;

    func_800E2438();
    func_800E2354();
    zero = 0;
    handle = func_80032E00(zero, 0x7B00);
    result = func_800E25D0(func_8004B594(((s8 *)&D_80085860) + (D_80084F6C * 0x68),
                                         FIELD(arg0, s32, 0x30), zero, zero, 0x7B00, handle));
    if (((result << 0x10) == 0) && ((func_800E3714(handle) << 0x10) != 0)) {
        result = 2;
    }
    func_800E2480();
    if ((result << 0x10) == 0) {
        state = D_80084F28;
        FIELD(state, s32, 8) = func_800E24A0(state + 0xC, FIELD(state, s32, 4) - 0xC);
    } else {
        func_800E1F84(zero);
    }
    func_80032F3C(zero, handle);
    return result;
}
