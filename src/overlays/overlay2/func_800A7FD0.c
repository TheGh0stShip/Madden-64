#include "types.h"

typedef struct {
    u8 pad00[0x60];
    s32 *list;
} Screen;

typedef struct {
    u8 pad00[0x44];
    s32 slots[19];
} Context;

extern u32 D_80069C0C[];
extern u32 *D_80072720[];
extern u8 D_800BDEC8[];

Context *func_800DD634(void);

void func_800A7FD0(Screen *screen, s32 unused, s8 team) {
    s32 *list = screen->list;
    Context *context = func_800DD634();
    u32 *flags = D_80072720[team];
    u16 i;
    u16 j;

    for (i = 0; i < 19;) {
        u32 bits = flags[D_800BDEC8[i]];

        for (j = 0; j < 8; j++) {
            if (D_80069C0C[j] & bits) {
                break;
            }
        }
        context->slots[i] = list[j];
        i++;
    }
}
