#include "types.h"

typedef struct StridedState {
    s16 state;
    u8 pad[0xD2];
    u16 value;
    u8 tail[2];
} StridedState;

extern StridedState D_80088B78[];
extern u16 D_8008616C;
extern void func_80035F88(u16 channel, u16 value);

void strided_state_consume(s16 index) {
    s16 state = D_80088B78[index].state;

    if (state != 0) {
        if ((state & 2) == 0) {
            func_80035F88(D_8008616C, D_80088B78[index].value);
        }
        D_80088B78[index].state = 0;
    }
}
