#include "types.h"

extern void func_8002E17C(void *destination, const void *source, u32 size);

void strided_rows_copy(u8 *source_arg, u8 *destination_arg, u16 stride_arg,
                       u16 offset, u16 row, u16 width, u16 rows)
{
    u8 *source;
    u8 *destination;
    u16 count;
    u32 copy_width;
    u32 saved_stride;
    u32 row_count;
    u32 stride;
    u32 loaded_rows;
    u32 product;

    stride = stride_arg;
    product = row * stride;
    source = source_arg;
    destination = destination_arg + product;
    loaded_rows = rows;
    count = 0;
    destination += offset;
    if (loaded_rows != 0) {
        copy_width = width;
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
