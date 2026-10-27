#include "types.h"

typedef struct ImageRgbAccumulateState {
    u8 pad00[0x18];
    u8 **clamp_tables;
    u8 pad1C[0x14];
    u32 phase;
    s32 *red_offsets;
    s32 *green_offsets;
    s32 *blue_offsets;
} ImageRgbAccumulateState;

typedef struct ImageRgbAccumulateContext {
    u8 pad000[0x70];
    s32 width;
    u8 pad074[0x154];
    ImageRgbAccumulateState *state;
} ImageRgbAccumulateContext;

void func_8006099C(
    ImageRgbAccumulateContext *context,
    u8 **input_rows,
    u8 **output_rows,
    s32 row_count)
{
    register s32 remaining_rows __asm__("$21");
    ImageRgbAccumulateState *state;
    u8 **clamp_tables;
    register s32 width __asm__("$22");
    register u8 *red_clamp __asm__("$20");
    register u8 *green_clamp __asm__("$19");
    register u8 *blue_clamp __asm__("$18");
    register u8 **saved_output_rows __asm__("$17");
    register u8 **saved_input_rows __asm__("$16");
    register s32 row __asm__("$14");
    u64 stack_padding;

    __asm__("" : : "m"(stack_padding));
    state = context->state;
    remaining_rows = row_count;
    __asm__("" : "=r"(remaining_rows) : "0"(remaining_rows));
    clamp_tables = state->clamp_tables;
    width = context->width;
    red_clamp = clamp_tables[0];
    green_clamp = clamp_tables[1];
    blue_clamp = clamp_tables[2];
    if (remaining_rows > 0) {
        row = 0;
        saved_output_rows = output_rows;
        saved_input_rows = input_rows;
      do {
        u32 phase = state->phase;
        u8 *input = *saved_input_rows;
        u8 *output = *saved_output_rows;
        u32 position = 0;
        s32 remaining = width;
        s32 *red_offsets = state->red_offsets + phase * 16;
        s32 *green_offsets = state->green_offsets + phase * 16;
        s32 *blue_offsets = state->blue_offsets + phase * 16;

        while (remaining != 0) {
            register u32 red __asm__("$4") = *input++;
            register u32 green __asm__("$5") = *input++;
            register u32 blue __asm__("$7") = *input++;

            *output++ = red_clamp[red + red_offsets[position]] +
                green_clamp[green + green_offsets[position]] +
                blue_clamp[blue + blue_offsets[position]];
            position = (position + 1) & 15;
            remaining--;
        }
        phase = (phase + 1) & 15;
        state->phase = phase;
        saved_output_rows++;
        row++;
        saved_input_rows++;
      } while (row < remaining_rows);
    }
}
