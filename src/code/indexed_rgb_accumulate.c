#include "types.h"

typedef struct RgbLookupOwner {
    u8 pad00[0x18];
    u8 **channels;
} RgbLookupOwner;

typedef struct RgbIndexContext {
    u8 pad000[0x70];
    s32 width;
    u8 pad074[0x154];
    RgbLookupOwner *owner;
} RgbIndexContext;

void indexed_rgb_accumulate(RgbIndexContext *context, u8 **source_planes,
                            u8 **output_planes, s32 plane_count)
{
    u32 stack_padding;
    register s32 width __asm__("$24") = context->width;
    u8 **channels = context->owner->channels;
    register u8 *red __asm__("$15") = channels[0];
    register u8 *green __asm__("$14") = channels[1];
    register u8 *blue __asm__("$13") = channels[2];
    register s32 plane __asm__("$11");
    register u8 **sources __asm__("$12");

    __asm__("" : : "m"(stack_padding));
    plane = 0;
    if (plane_count <= 0) {
        return;
    }
    sources = source_planes;
    do {
        register u8 *source __asm__("$8") = *sources;
        register u8 *output __asm__("$10") = *output_planes;
        register s32 remaining __asm__("$9") = width;

        if (remaining != 0) {
            do {
                register u32 red_index __asm__("$2") = *source++;
                register u32 green_index __asm__("$3") = *source++;
                register u32 blue_index __asm__("$4") = *source++;
                register u32 red_value __asm__("$2") = red[red_index];
                register u8 *green_address __asm__("$3") = green + green_index;
                register u32 green_value __asm__("$5");
                register u32 blue_value __asm__("$3");
                u32 total;
                __asm__("" : "=r"(green_address) : "0"(green_address));
                green_value = *green_address;
                blue_value = blue[blue_index];
                total = red_value + green_value;
                __asm__("" : "=r"(total) : "0"(total));
                total += blue_value;
                *output++ = total;
                __asm__("" : "=r"(remaining)
                        : "0"(remaining), "r"(blue_value));
                remaining--;
            } while (remaining != 0);
        }
        output_planes++;
        sources++;
        plane++;
    } while (plane < plane_count);
}
