#include "types.h"

extern void *memory_pool_range_take(s32, s32);
extern void display_frame_context_initialize(void);
extern void func_8000BE80(void);

extern u16 *D_800854A8[64];
extern u32 D_800855D8[];
extern u16 D_8008AFD4;

void render_buffers_initialize(void) {
    s16 i;
    u16 *frame;
    u16 *buffer;
    s16 row;
    s16 column;
    s16 y;
    s32 k;
    s32 y0, y1, x0, x1;

    for (i = 0; i < 64; i++) {
        D_800854A8[i] = memory_pool_range_take(0, 0x960);
    }
    display_frame_context_initialize();
    func_8000BE80();
    frame = (u16 *)(D_800855D8[D_8008AFD4] | 0xA0000000);
    for (row = 0; row < 8; row++) {
        column = 0;
        y0 = row * 30;
        y1 = (row + 1) * 30;
        for (; column < 8; column++) {
            k = 0;
            x0 = column * 40;
            x1 = (column + 1) * 40;
            buffer = D_800854A8[row * 8 + column];
            for (y = y0; y < y1; y++) {
                for (i = x0; i < x1; i++) {
                    buffer[k++] = frame[y * 320 + i];
                }
            }
        }
    }
}
