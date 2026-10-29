#include "types.h"

typedef struct {
    u8 pad00[0x40];
    s32 slots[6];
} State;

#ifndef NULL
#define NULL 0
#endif

void func_8000BE80(void);
s32 func_8000DA98(s32);                         /* extern */
s32 func_80016FC4(u16);                         /* extern */
s32 func_800D628C(s32);                         /* extern */
State *func_800DD634(void);
extern s32 D_800C3A10;
extern u16 D_800C3A1C;
extern s32 D_800C504C;

void func_8009C990(s32 arg0) {
    State *state;
    s32 i;

    state = func_800DD634();
    for (i = 1; i < 6; i++) {
        state->slots[i] = 0;
    }
    func_8000BE80();
    func_8000DA98(D_800C3A10);
    func_8000DA98(D_800C504C);
    func_800D628C(arg0);
    func_80016FC4(D_800C3A1C);
}
