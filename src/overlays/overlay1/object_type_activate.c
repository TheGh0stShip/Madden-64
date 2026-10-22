#include "types.h"

typedef struct ObjectTypeState {
    u8 pad[0x24];
    u32 flags;
} ObjectTypeState;

extern ObjectTypeState* D_800886E4;

s32 func_800A5DA0(u8* object) {
    *(u32*)(object + 0x9C) = 0;
    if (*(u32*)(object + 0x2C) == 0x44) {
        ObjectTypeState* state = D_800886E4;
        *(u32*)(object + 0x9C) = 1;
        state->flags = 0x00100000;
    }
    return 0;
}
