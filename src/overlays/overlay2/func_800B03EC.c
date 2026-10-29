#include "types.h"

#define NULL 0

typedef struct {
    u8 pad00[0x34];
    s32 unk34;
} State;

extern s32 D_80086E64;
extern void (*D_800893B8)(void);

State *func_800DD634(void);
void func_800DD4B8(void);
void func_8001AEA8(State *);

void func_800B03EC(void) {
    State *state;

    if (D_800893B8 != NULL) {
        state = func_800DD634();
        D_80086E64 = state->unk34;
        while (D_800893B8 != NULL) {
            D_800893B8();
        }
        func_800DD4B8();
        func_8001AEA8(state);
    }
}
