#include "types.h"

typedef struct {
    s16 mode;
    s16 value;
    s32 param;
    s32 extra;
} ModeState;

extern ModeState D_800857E0;
extern s16 D_80086BF2;
extern void *D_8008AF88;
extern u8 D_8006DEC0[];
extern u8 D_8006DECC[];

void func_800AD77C(s32);

void func_800B1CF4(s16 mode, s16 value, s32 param, s32 extra) {
    ModeState *state;

    switch (mode) {
        case 11:
        case 12:
        case 19:
            if ((u32)((u16)D_800857E0.mode - 5) < 2) {
                return;
            }
            goto reset;
        case 15:
            if (D_8008AF88 == D_8006DECC || D_8008AF88 == D_8006DEC0) {
                goto reset;
            }
            goto set_mode;
        case 0:
        reset:
            func_800AD77C(0);
            goto set_mode;
        case 13:
        case 14:
            state = &D_800857E0;
            if (state->mode == mode) {
                D_80086BF2 = value;
                D_800857E0.extra = extra;
                return;
            }
            D_80086BF2 = 0x7FFE;
            state->mode = mode;
            goto set_value;
        default:
            state = &D_800857E0;
            switch (state->mode) {
                case 10:
                    if (mode == 9) {
                        return;
                    }
                    state->mode = mode;
                    goto set_value;
                case 3:
                case 4:
                case 18:
                    if (mode == 1) {
                        D_800857E0.value = value;
                        return;
                    }
                    break;
            }
            break;
    }
set_mode:
    D_800857E0.mode = mode;
set_value:
    D_800857E0.value = value;
    D_800857E0.param = param;
    D_800857E0.extra = extra;
}
