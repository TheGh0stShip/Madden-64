#include "types.h"

typedef struct MenuResourceState {
    u8 pad0[16];
    u32 state;
} MenuResourceState;

extern volatile u16 D_8008AFD4;
extern u32 D_8007A564;
extern u8 D_80042A04[];
extern u32 D_8007A558[];
extern u32 D_8007A998[];
extern u32 D_8007A560;
extern u32 D_8007A9A0;
extern u32 D_8007A9B4;
extern u32 D_8008B368;
extern u32 D_8008A058;
extern u32 D_8008A054;

extern void func_80008F30(void *source, void *callback, void *state, u32 size);
extern void func_8004291C(void);
extern s16 func_800B2240(void);
extern void func_80043B20(MenuResourceState *state, u32 equal);

void func_80043D7C(MenuResourceState *state, void *source)
{
    MenuResourceState *saved_state = state;
    u32 current = D_8008AFD4;
    u32 selected;
    u32 present;

    if (D_8007A564 != current) {
        func_80008F30(source, D_80042A04, saved_state, 200);
        current = D_8008AFD4;
        D_8007A560 = D_8007A558[current];
        D_8007A9A0 = D_8007A998[current];
        func_8004291C();
        D_8007A9B4 = 0;
        D_8007A564 = D_8008AFD4;
    }

    if (func_800B2240() != 0) {
        selected = D_8008B368;
    } else {
        selected = D_8008A058;
        if (selected == 0) {
            selected = D_8008A054;
            present = selected != 0;
            present = -present;
            selected &= present;
        }
    }
    func_80043B20(saved_state, saved_state->state == selected);
}
