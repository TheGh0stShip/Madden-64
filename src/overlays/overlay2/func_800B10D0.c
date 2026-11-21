#include "types.h"

typedef struct {
    s32 unk_00;
    s32 unk_04;
    s32 unk_08;
    s32 unk_0C;
    s32 unk_10;
    s32 flags;
} Child;

typedef struct {
    u8 pad00[3];
    u8 unk_03;
    u8 unk_04;
    u8 pad05[0x18 - 5];
    s32 unk_18;
    u8 pad1C[0x20 - 0x1C];
    s32 unk_20;
    s32 unk_24;
} State;

typedef struct {
    u8 pad00[0x38];
    Child *child;
    u8 pad3C[0x60 - 0x3C];
    State *state;
} Screen;

void func_800E08A4(s32);
void func_800B13E8(Child *, s32, Screen *);
void func_800B1440(s32, s32, Screen *);
void func_800DF6EC(void);
void func_800DF72C(void);
void func_800B1648(Screen *);
void func_800B1694(Screen *);
void func_800B17A0(State *);
void func_800B186C(State *, u8);
void func_800B17EC(State *, u8);
void func_800B1ED0(State *);
void func_800B1A20(Screen *);
void func_800B1B20(Screen *);
void func_800D63B4(Screen *);
void func_800D6424(s32, s32, s32, s32);
u8 func_80092CFC(u8, s32, s32);
u8 func_80092BD0(u8, s32, s32);

void func_800B10D0(Screen *arg0, s32 arg1, s16 event) {
    Screen *screen = arg0;
    State *state = screen->state;
    u16 value;

    switch (event) {
    case 13:
        func_800E08A4(state->unk_24);
        func_800B13E8(screen->child, 0, screen);
        func_800B1440(state->unk_20, 0, screen);
        screen->child->flags |= 1;
        break;
    case 6:
        func_800DF6EC();
        func_800B1648(screen);
        value = state->unk_04 - 1;
        if (value >= 25) {
            value = 24;
        }
        if (value == 24) {
            value--;
        }
        if (value == 23) {
            value--;
        }
        if (value >= 25) {
            value = 24;
        }
        func_800B186C(state, value);
        func_800B1694(screen);
        func_800B17A0(state);
        break;
    case 7:
        func_800DF6EC();
        func_800B1648(screen);
        value = state->unk_04 + 1;
        if (value >= 25) {
            value = 0;
        }
        if (value == 23) {
            value++;
        }
        if (value == 24) {
            value++;
        }
        if (value >= 25) {
            value = 0;
        }
        func_800B186C(state, value);
        func_800B1694(screen);
        func_800B17A0(state);
        break;
    case 5:
        func_800DF6EC();
        func_800B1648(screen);
        func_800B17EC(state, func_80092CFC(state->unk_03, 30, 1));
        func_800B1694(screen);
        func_800B17A0(state);
        func_800B1ED0(state);
        break;
    case 4:
        func_800DF6EC();
        func_800B1648(screen);
        func_800B17EC(state, func_80092BD0(state->unk_03, 30, 1));
        func_800B1694(screen);
        func_800B17A0(state);
        func_800B1ED0(state);
        break;
    case 8:
        func_800DF72C();
        func_800B1A20(screen);
        break;
    case 17:
    case 28:
        func_800DF72C();
        func_800B1B20(screen);
        break;
    case 12:
        func_800D63B4(screen);
        func_800D6424(state->unk_18, 0xF0, 2, 10);
        break;
    }
}
