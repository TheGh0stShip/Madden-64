#include "types.h"

typedef struct {
    u8 pad00[0x60];
    s32 unk_60;
    u8 pad64[8];
    s32 unk_6C;
} StateAD5B0;

typedef struct {
    char *unk_00;
    char *unk_04;
    u8 pad08[4];
    char *unk_0C;
    u8 pad10[8];
    s32 unk_18;
    u8 pad1C[4];
} MessageAD5B0;

extern s16 D_80084F6C;
extern char D_800C265C[];
extern char D_800C2994[];
extern char D_800C29B0[];
extern char D_800C29D4[];

void func_80094028(void);
void func_80094080(void);
void func_80092B98(void);
s16 func_800ACEC0(s16 index);
s16 func_800E1588(s16 index);
s16 func_800E154C(s16 index);
void func_800ACC64(StateAD5B0 *state);
void func_800ACE00(StateAD5B0 *state);
void func_800D67B8(MessageAD5B0 *message);
void func_800D6454(MessageAD5B0 *message);

void func_800AD5B0(StateAD5B0 *state) {
    MessageAD5B0 message;
    s16 start;
    s16 original;
    u8 done;
    s16 result;

    start = D_80084F6C;
    done = 0;
    original = start;
    do {
        func_80094028();
        func_80092B98();
        func_80092B98();
        D_80084F6C = (D_80084F6C + 1) % 4;
        result = func_800ACEC0(D_80084F6C);
        if (result == 0 || result == 3) {
            done = 1;
        } else if (D_80084F6C == start) {
            done = 1;
        }
    } while (!done);

    result = func_800E1588(D_80084F6C);
    state->unk_6C = result;
    if (result == 0) {
        state->unk_60 = 1;
    } else {
        state->unk_60 = 0;
    }
    func_80094080();
    func_80092B98();
    func_80092B98();
    func_80092B98();
    func_80092B98();
    if (D_80084F6C != original) {
        func_800ACC64(state);
        func_800ACE00(state);
    } else if (func_800E154C(D_80084F6C) != 0) {
        func_800D67B8(&message);
        message.unk_00 = D_800C265C;
        message.unk_0C = D_800C29D4;
        message.unk_18 = 0;
        func_800D6454(&message);
        state->unk_60 = 0;
    } else {
        func_800D67B8(&message);
        message.unk_00 = D_800C2994;
        message.unk_04 = D_800C29B0;
        message.unk_0C = D_800C29D4;
        message.unk_18 = 0;
        func_800D6454(&message);
    }
}
