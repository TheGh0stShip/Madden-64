#include "types.h"

typedef struct AudioChannelState {
    volatile s32 field00;
    volatile s32 field04;
    u8 pad08[0x10];
    volatile u32 flags18;
} AudioChannelState;

extern void *D_80064A00;
extern volatile s32 D_800734F8;
extern AudioChannelState *D_80087B6C;
extern s32 D_80084F60[];
extern u8 D_800885F0[];
extern s32 D_800712C8;
extern s32 func_80004B40(void);
extern void func_8004CDA8(void *entry, s32 value, s32 count);

void func_8003D78C(void)
{
    register s32 sentinel __asm__("$18");
    register s32 value __asm__("$16");
    register s32 prior __asm__("$17");
    register s32 counter __asm__("$17");
    register s32 more __asm__("$19");
    register s32 *slot __asm__("$16");
    register u8 *entry __asm__("$18");
    AudioChannelState *state;
    s32 current;

    if (D_80064A00 == 0) return;
    if (D_800734F8 == -1) goto cleanup;
    sentinel = -1;

update:
    state = D_80087B6C;
    if ((state->flags18 & 5) == 0) goto disable;
    value = state->field00 - 3;
    if (value < 0) {
        value = 0;
    }
    state->field04 = value;
    state->field00 = state->field04;
    prior = func_80004B40();
    do {
        current = func_80004B40();
    } while (prior == current);
    if (value != 0) goto check;
    state = D_80087B6C;
    state->flags18 |= 8;
    goto check;

disable:
    D_800734F8 = sentinel;

check:
    if (D_800734F8 != sentinel) goto update;

cleanup:
    counter = 1;
    slot = &D_80084F60[1];
    entry = D_800885F0 + 0x18;
    do {
        more = counter;
        if (*slot != 0) {
            func_8004CDA8(entry, 0, 1);
            *slot = 0;
        }
        slot--;
        entry -= 0x18;
        counter--;
    } while (more != 0);
    __asm__("" : "=r"(more) : "0"(more));
    D_800712C8 = 0;
}
