#include "types.h"

typedef struct IndexLookupOwner {
    u8 pad00[0x18];
    u8 **lookup;
} IndexLookupOwner;

typedef struct IndexPlaneContext {
    u8 pad000[0x70];
    s32 width;
    u8 pad074[4];
    s32 height;
    u8 pad07C[0x14C];
    IndexLookupOwner *owner;
} IndexPlaneContext;

void index_planes_accumulate(IndexPlaneContext *context, u8 **index_planes,
                             u8 **output_planes, s32 plane_count)
{
    u64 stack_padding;
    register s32 width __asm__("$24") = context->width;
    register s32 height __asm__("$13") = context->height;
    register u8 **lookup __asm__("$15") = context->owner->lookup;
    register s32 plane __asm__("$14");

    __asm__("" : : "m"(stack_padding));

    for (plane = 0; plane < plane_count; plane++) {
        register u8 *indices __asm__("$11") = *index_planes;
        register u8 *output __asm__("$12") = *output_planes;
        register s32 remaining __asm__("$10") = width;

        if (remaining != 0) {
            do {
                register s32 row __asm__("$9");
                register s32 total __asm__("$4");
                register u8 **lookup_row __asm__("$8");

                row = 0;
                __asm__("" : "=r"(row) : "0"(row));
                total = 0;
                if (height > 0) {
                    lookup_row = lookup;
                    do {
                        total += (*lookup_row)[*indices++];
                        row++;
                        lookup_row++;
                    } while (row < height);
                }
                *output++ = total;
                remaining--;
            } while (remaining != 0);
        }
        output_planes++;
        index_planes++;
    }
}
