#include "types.h"

typedef struct Object {
    s16 unk00;
    s16 state;
    u16 next_state;
    u16 unk06;
    u16 next_unk06;
    s16 unk0A;
    s32 unk0C;
    s32 next_unk0C;
} Object;

extern Object *D_8008A724[];
extern void (*D_8006A700[])(Object *);

void func_800A7D80(s16 arg0) {
    u32 i;

    for (i = 0; i < 1; i++) {
        if (D_8008A724[i]) {
            D_8008A724[i]->unk0A = arg0;
            D_8008A724[i]->unk0C = D_8008A724[i]->next_unk0C;
            D_8008A724[i]->state = D_8008A724[i]->next_state;
            D_8008A724[i]->unk06 = D_8008A724[i]->next_unk06;
            D_8006A700[D_8008A724[i]->state](D_8008A724[i]);
        }
    }
}
