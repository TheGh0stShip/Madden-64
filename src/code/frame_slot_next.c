#include "types.h"

typedef struct FrameSlot {
    u8 pad00[0xD];
    u8 state;
    u8 pad0E[0x1A];
} FrameSlot;

extern FrameSlot* D_8007343C;

u16 func_8003A584(u16 handle) {
    u16 index;

    if (handle != 0) {
        index = (handle & 0x7FFF) + 1;
    } else {
        index = handle;
    }
    while (index < 24) {
        if (D_8007343C[index].state != 0xFF) {
            return index | 0x8000;
        }
        index++;
    }
    return 0;
}
