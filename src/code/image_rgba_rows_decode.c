#include "types.h"

typedef struct ImageRgbaTables {
    void (*entry)(void);
    void (*handler)(void);
    s32 *table0;
    s32 *table1;
    s32 *table2;
    s32 *table3;
} ImageRgbaTables;

typedef struct ImageRgbaContext {
    u8 pad000[0x70];
    u32 width;
    u8 pad074[0xCC];
    u8 *clamp_table;
    u8 pad144[0x80];
    ImageRgbaTables *tables;
} ImageRgbaContext;

void func_8005FB9C(
    ImageRgbaContext *context,
    u8 ***planes,
    s32 first_row,
    u8 **output_rows,
    s32 row_count)
{
    register s32 *table0 __asm__("$20") = context->tables->table0;
    register s32 *table1 __asm__("$19") = context->tables->table1;
    register s32 *table2 __asm__("$18") = context->tables->table2;
    register s32 *table3 __asm__("$17") = context->tables->table3;
    register u32 width __asm__("$16") = context->width;
    register s32 remaining_rows __asm__("$15") = row_count;
    register u8 ***saved_planes __asm__("$24") = planes;
    u8 *clamp_end = context->clamp_table + 255;

    remaining_rows--;
    if (remaining_rows >= 0) {
        register u32 offset __asm__("$4") = first_row * 4;

        do {
            u8 *source0;
            u8 *source1;
            u8 *source2;
            u8 *source3;
            register u8 *output __asm__("$13");

            first_row++;
            source0 = *(u8 **)(offset + (u32)saved_planes[0]);
            output = *output_rows++;
            source1 = *(u8 **)(offset + (u32)saved_planes[1]);
            source2 = *(u8 **)(offset + (u32)saved_planes[2]);
            source3 = *(u8 **)(offset + (u32)saved_planes[3]);
            if (width != 0) {
                register u8 *plane0 __asm__("$10") = source0;
                register u8 *plane1 __asm__("$11") = source1;
                register u8 *plane2 __asm__("$12") = source2;
                register u8 *plane3 __asm__("$9") = source3;
                register u8 *end __asm__("$25") = plane3 + width;
                register u8 *output_tail __asm__("$8") = output + 3;

                do {
                    u32 component2 = *plane2++;
                    u32 component0 = *plane0++;
                    u32 component1 = *plane1++;

                    *output = *(clamp_end -
                        (component0 + table0[component2]));
                    output_tail[-2] = *(clamp_end - (component0 +
                        ((table3[component1] + table2[component2]) >> 16)));
                    output_tail[-1] = *(clamp_end -
                        (component0 + table1[component1]));
                    output_tail[0] = *plane3++;
                    output += 4;
                    output_tail += 4;
                } while (plane3 < end);
            }
            remaining_rows--;
            offset = first_row * 4;
        } while (remaining_rows >= 0);
    }
}
