#include "types.h"

typedef struct ImagePlaneContext {
    u8 pad000[0x134];
    s32 count;
} ImagePlaneContext;

typedef struct ImagePlaneParameters {
    u8 pad00[0x28];
    s32 width;
} ImagePlaneParameters;

void image_plane_process(ImagePlaneContext *context, ImagePlaneParameters *parameters,
    u8 **inputs, u8 ***output_groups)
{
    register ImagePlaneContext *saved_context __asm__("$25") = context;
    register ImagePlaneParameters *saved_parameters __asm__("$16") = parameters;
    register u8 **input_slot __asm__("$14") = inputs;
    register u8 **outputs __asm__("$7") = *output_groups;
    register s32 output_index __asm__("$24") = 0;
    u64 stack_padding;

    __asm__("" : : "m"(stack_padding));

    if (saved_context->count > 0) {
        do {
            register s32 pass __asm__("$13") = 0;
            register u8 **output_slot __asm__("$15") = outputs + output_index;

            do {
                register u8 *center __asm__("$11") = input_slot[0];
                register u8 *side __asm__("$9");
                register u8 *output __asm__("$8");
                register u32 first __asm__("$6");
                register u32 second __asm__("$4");
                register u32 previous_first __asm__("$12");
                register u32 previous_second __asm__("$6");
                register s32 remaining __asm__("$10");

                if (pass == 0) {
                    side = input_slot[-1];
                } else {
                    side = input_slot[1];
                }

                output = *output_slot++;
                output_index++;
                {
                    register u32 side0 __asm__("$6") = *side++;
                    register u32 center0 __asm__("$4") = *center++;
                    register u32 side1 __asm__("$5") = *side++;
                    register u32 center1 __asm__("$3") = *center++;

                    first = center0 * 3 + side0;
                    second = center1 * 3 + side1;
                }
                *output++ = (first * 4 + 8) >> 4;
                *output++ = (first * 3 + second + 7) >> 4;
                previous_first = first;
                previous_second = second;
                remaining = saved_parameters->width - 2;
                while (remaining != 0) {
                    u32 next;

                    next = center[0] * 3 + side[0];
                    center++;
                    side++;
                    *output++ = (previous_second * 3 + previous_first + 8) >> 4;
                    previous_first = previous_second;
                    remaining--;
                    previous_second = next;
                    *output++ = (previous_first * 3 + previous_second + 7) >> 4;
                }
                *output++ = (previous_second * 3 + previous_first + 8) >> 4;
                *output = (previous_second * 4 + 7) >> 4;
                pass++;
            } while (pass < 2);
            input_slot++;
        } while (output_index < saved_context->count);
    }
}
