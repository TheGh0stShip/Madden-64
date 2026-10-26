#include "types.h"

extern void func_8002E17C(void *destination, const void *source, u32 size);

void strided_rows_copy(u8 *source_arg, u8 *destination_arg, u16 stride_arg,
                       u16 offset, u16 row, u16 width, u16 rows)
{
    register u8 *source __asm__("$19");
    register u8 *destination __asm__("$16");
    register u16 count __asm__("$18");
    register u32 copy_width __asm__("$17");
    register u32 saved_stride __asm__("$21");
    register u32 row_count __asm__("$20");
    register u32 stride __asm__("$3");
    register u16 width_arg __asm__("$6") = width;
    register u32 loaded_rows __asm__("$2");
    register u32 product __asm__("$2");

    stride = stride_arg;
    product = row * stride;
    source = source_arg;
    destination = destination_arg + product;
    loaded_rows = rows;
    count = 0;
    destination += offset;
    if (loaded_rows != 0) {
        __asm__("" : "=r"(width_arg) : "0"(width_arg));
        copy_width = width_arg & 0xFFFF;
        saved_stride = stride;
        row_count = loaded_rows;
        do {
            func_8002E17C(destination, source, copy_width);
            source += copy_width;
            count++;
            destination += saved_stride;
        } while (count < row_count);
    }
}
