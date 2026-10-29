#include "types.h"

typedef struct RowPointerBuildState {
    u8* output;
    u8 pad4[8];
    u8 column_count;
    u8 padD[0xF];
    u8 row_count;
    u8 pad1D[7];
    u8* row_stride;
    u8* first_column;
    u8 pad2C[0x10];
    u8** columns;
} RowPointerBuildState;

void func_800DB00C(RowPointerBuildState* state) {
    u8* output = state->output;
    u32 row;

    for (row = 0; row < state->row_count; row++) {
        if (state->row_stride[row] != 0) {
            u32 column = 0;
            u32 slot = state->first_column[row];

            while (column < state->column_count) {
                output[0] = 32;
                output[1] = 0;
                state->columns[slot] = output;
                slot++;
                output += state->row_stride[row];
                column++;
            }
        }
    }
}
