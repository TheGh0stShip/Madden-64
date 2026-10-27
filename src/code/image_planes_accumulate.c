#include "types.h"

typedef struct ImagePlaneState {
    u8 pad00[0x18];
    u8 **clamp_tables;
    u8 pad1C[0x14];
    u32 phase;
    s32 *offset_tables[1];
} ImagePlaneState;

typedef struct ImagePlaneContext {
    u8 pad000[0x70];
    s32 width;
    u8 pad074[4];
    s32 plane_count;
    u8 pad07C[0x14C];
    ImagePlaneState *state;
} ImagePlaneContext;

extern void func_800632F4(u8 *output, s32 width);

void func_80060870(
    ImagePlaneContext *context,
    u8 **input_planes,
    u8 **output_planes,
    s32 count)
{
    register ImagePlaneState *state __asm__("$18");
    register s32 plane_count __asm__("$17");
    register s32 width __asm__("$20");
    register u8 **outputs __asm__("$16");
    register u8 **inputs __asm__("$19");
    register u8 **outputs_end __asm__("$21");
    u64 stack_padding;

    __asm__("" : : "m"(stack_padding));
    state = context->state;
    plane_count = context->plane_count;
    width = context->width;
    if (count > 0) {
      outputs = output_planes;
      inputs = input_planes;
      {
        register u32 output_bytes __asm__("$2") = count * 4;
        outputs_end = (u8 **)(output_bytes + (u32)output_planes);
      }
      do {
        register u32 phase __asm__("$13");
        register s32 plane __asm__("$7");
        ImagePlaneState *plane_state;

        func_800632F4(*outputs, width);
        phase = state->phase;
        plane = 0;
        if (plane_count > 0) {
          register u8 **input_cursor __asm__("$24") = inputs;
          register u8 **output_cursor __asm__("$15") = outputs;
          register u32 phase_offset __asm__("$14") = phase << 6;

          plane_state = state;
          do {
            u8 *output = *output_cursor;
            u8 *input = *input_cursor + plane;
            u8 *clamp = state->clamp_tables[plane];
            s32 *offsets = (s32 *)((u8 *)plane_state->offset_tables[0] +
                phase_offset);
            u32 position = 0;
            s32 remaining = width;

            while (remaining != 0) {
                u32 value = *input;

                input += plane_count;
                *output = *output + clamp[value + offsets[position]];
                output++;
                position = (position + 1) & 15;
                remaining--;
            }
            plane++;
            plane_state = (ImagePlaneState *)((u8 *)plane_state + 4);
          } while (plane < plane_count);
        }
        __asm__("" : "=r"(phase) : "0"(phase));
        {
          register u32 next_phase __asm__("$2") = phase + 1;
          phase = next_phase & 15;
        }
        state->phase = phase;
        outputs++;
        inputs++;
      } while ((s32)outputs < (s32)outputs_end);
    }
}
