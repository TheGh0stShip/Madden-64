#include "types.h"

typedef s32 (*RuntimeWindowColorCallback)(void* context, u16 index);

typedef struct RuntimeWindowRenderState {
    u8 pad0[0xA];
    u16 position;
    u8 column_count;
    u8 offset;
    u8 padE[0xE];
    u8 row_count;
    u8 current_row;
    u8 pad1E[6];
    u8* row_stride;
    u8* first_column;
    u8 pad2C[2];
    u8 flags;
    u8 default_color;
    u8 active_color;
    u8 selected_color;
    u8 pad32[6];
    RuntimeWindowColorCallback color_callback;
    u8 pad3C[8];
    void* owner;
    u8 pad48[4];
    void* context;
} RuntimeWindowRenderState;

extern void func_8001ECAC(void* owner, u32 index, s32 color);

void func_800DB934(RuntimeWindowRenderState* state) {
    volatile u8 scratch[16];
    u32 row;

    (void)scratch;

    if ((state->flags & 7) != 0) {
        if (state->row_count != 0) {
            row = 0;
            do {
                if (state->row_stride[row] != 0) {
                    u32 index = state->first_column[row];
                    u32 column;

                    column = 0;
                    if (state->column_count != 0) {
                        do {
                            s32 color;

                            if (state->color_callback == 0) {
                                color = state->default_color;
                                if ((state->flags & 2) && row == state->current_row) {
                                    color = state->selected_color;
                                }
                                if ((state->flags & 4) && column == state->offset) {
                                    color = state->selected_color;
                                }
                                if (state->flags & 1) {
                                    color = state->active_color;
                                }
                            } else {
                                color = state->color_callback(state->context,
                                                              state->position + column);
                            }
                            func_8001ECAC(state->owner, index, color);
                            column++;
                            index++;
                        } while (column < state->column_count);
                    }
                }
                row++;
            } while (row < state->row_count);
        }
    }
}
