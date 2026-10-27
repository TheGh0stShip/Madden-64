#include "types.h"

typedef struct ImageRgbTables {
    void (*entry)(void);
    void (*handler)(void);
    s32 *table0;
    s32 *table1;
    s32 *table2;
    s32 *table3;
} ImageRgbTables;

typedef struct ImageRgbContext {
    u8 pad000[0x70];
    u32 width;
    u8 pad074[0xCC];
    u8 *clamp_table;
    u8 pad144[0x80];
    ImageRgbTables *tables;
} ImageRgbContext;

void func_8005F998(
    ImageRgbContext *context,
    u8 ***planes,
    s32 first_row,
    u8 **output_rows,
    s32 row_count)
{
    register s32 *table0 __asm__("$19");
    register s32 *table1 __asm__("$18");
    register s32 *table2 __asm__("$17");
    register s32 *table3 __asm__("$16");
    register u32 width __asm__("$25");
    register u8 *clamp __asm__("$13");
    register u8 ***saved_planes __asm__("$24");
    register u32 offset __asm__("$4");

    table0 = context->tables->table0;
    table1 = context->tables->table1;
    table2 = context->tables->table2;
    table3 = context->tables->table3;
    width = context->width;
    clamp = context->clamp_table;
    row_count--;
    if (row_count >= 0) {
        saved_planes = planes;
        offset = first_row * 4;
        do {
            u8 *source0;
            u8 *source1;
            u8 *source2;
            register u8 *output __asm__("$12");

            first_row++;
            source0 = *(u8 **)(offset + (u32)saved_planes[0]);
            output = *output_rows++;
            source1 = *(u8 **)(offset + (u32)saved_planes[1]);
            source2 = *(u8 **)(offset + (u32)saved_planes[2]);
            if (width != 0) {
              register u8 *plane0 __asm__("$10") = source0;
              register u8 *plane1 __asm__("$11") = source1;
              register u8 *plane2 __asm__("$8") = source2;
              register u8 *end __asm__("$15") = plane2 + width;
              register u8 *output_tail __asm__("$9") = output + 2;

              do {
                u32 component2 = *plane2++;
                u32 component0 = *plane0++;
                u32 component1 = *plane1++;

                *output = clamp[component0 + table0[component2]];
                output_tail[-1] = clamp[component0 +
                    ((table3[component1] + table2[component2]) >> 16)];
                output_tail[0] = clamp[component0 + table1[component1]];
                output += 3;
                output_tail += 3;
              } while (plane2 < end);
            }
            row_count--;
            offset = first_row * 4;
        } while (row_count >= 0);
    }
}
