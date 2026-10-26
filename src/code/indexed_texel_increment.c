#include "types.h"

typedef struct TexelLookupOwner {
    u8 pad00[0x18];
    u16 **groups;
} TexelLookupOwner;

typedef struct TexelIndexContext {
    u8 pad000[0x70];
    s32 width;
    u8 pad074[0x154];
    TexelLookupOwner *owner;
} TexelIndexContext;

void indexed_texel_increment(TexelIndexContext *context, u8 **planes,
                             void *unused, s32 plane_count)
{
    u32 stack_padding;
    register s32 width __asm__("$12") = context->width;
    register u16 **groups __asm__("$11") = context->owner->groups;
    register s32 plane __asm__("$10");

    __asm__("" : : "m"(stack_padding));
    plane = 0;
    if (plane_count <= 0) {
        return;
    }
    do {
        register u8 *data __asm__("$9") = *planes;
        register s32 remaining __asm__("$8") = width;

        if (remaining != 0) {
            register u8 *cursor __asm__("$6") = data + 2;
            do {
                u16 *entry = (u16 *)((u8 *)groups[data[0] >> 3] +
                                     ((cursor[-1] >> 2) << 6) +
                                     ((cursor[0] >> 3) << 1));
                u16 old_value = *entry;
                u16 new_value = old_value + 1;
                *entry = new_value;
                if (new_value == 0) {
                    *entry = old_value;
                }
                cursor += 3;
                remaining--;
                data += 3;
            } while (remaining != 0);
        }
        plane++;
        planes++;
    } while (plane < plane_count);
}
