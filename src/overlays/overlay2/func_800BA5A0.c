#include "types.h"

typedef struct {
    u8 data[0x28];
} Panel;

extern void (*D_80073D48[])(u16, Panel *);
extern Panel D_800E76E0[];

void func_800BA5A0(void) {
    u16 i;

    for (i = 0; i < 7; i++) {
        D_80073D48[i](i + 1, &D_800E76E0[i]);
    }
}
