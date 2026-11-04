#include "types.h"

extern s8 D_800C5A5E;
extern u8 D_800C509E[];
extern u16 D_8006B9E4[];

void func_8003A600(s32, s32);
void func_80024EDC(s32);
void func_8003EB2C(void);

void func_8008D72C(void) {
    s8 *state;
    u8 i;

    state = &D_800C5A5E;
    if (*state == 0x4E) {
        *state = 0;
    }
    func_8003A600(1, 1);

    for (i = 0; i < 30; i++) {
        D_8006B9E4[i] = D_800C509E[i];
    }

    func_80024EDC(1);
    func_8003EB2C();
}
