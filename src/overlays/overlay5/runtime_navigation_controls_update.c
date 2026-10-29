#include "types.h"

typedef struct RuntimeNavigationState {
    u8 pad0[8];
    u16 width;
    u16 horizontal_position;
    u8 visible_columns;
    u8 padD[0xB];
    u16 height;
    u16 vertical_position;
    u8 row_count;
    u8 pad1D;
    u8 visible_rows;
    u8 pad1F[0xE];
    u8 control_set;
    u8 pad2E[0x12];
    void** controls;
} RuntimeNavigationState;

extern void func_80016FE4(void* control);
extern void func_80016FF4(void* control);

void func_800DC5BC(RuntimeNavigationState* state) {
    void* control;

    if (state->control_set == 0xFF) {
        return;
    }
    {
        control = state->controls[state->control_set];
        if (state->horizontal_position == 0) {
            func_80016FF4(control);
        } else {
            func_80016FE4(control);
        }
    }
    {
        control = state->controls[state->control_set + 1];
        if (state->horizontal_position + state->visible_columns >= state->width) {
            func_80016FF4(control);
        } else {
            func_80016FE4(control);
        }
    }
    if (state->visible_rows == state->row_count) {
        return;
    }
    {
        control = state->controls[state->control_set + 2];
        if (state->vertical_position == 0) {
            func_80016FF4(control);
        } else {
            func_80016FE4(control);
        }
    }
    {
        control = state->controls[state->control_set + 3];
        if (state->row_count + state->vertical_position >= state->height) {
            func_80016FF4(control);
        } else {
            func_80016FE4(control);
        }
    }
}
