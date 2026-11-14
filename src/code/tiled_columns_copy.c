/* IJG libjpeg 6a jdcolor.c: null_convert(). */
#include "types.h"

typedef u8 JSAMPLE;
typedef JSAMPLE *JSAMPROW;
typedef JSAMPROW *JSAMPARRAY;
typedef JSAMPARRAY *JSAMPIMAGE;
typedef u32 JDIMENSION;
typedef struct jpeg_decompress_struct *j_decompress_ptr;
struct jpeg_decompress_struct {
    u8 pad000[0x20];
    s32 num_components;
    u8 pad024[0x4C];
    JDIMENSION output_width;
};

void tiled_columns_copy(j_decompress_ptr cinfo, JSAMPIMAGE input_buf,
                        JDIMENSION input_row, JSAMPARRAY output_buf,
                        s32 num_rows)
{
    register JSAMPROW inptr;
    register JSAMPROW outptr;
    register JDIMENSION count;
    register s32 num_components = cinfo->num_components;
    JDIMENSION num_cols = cinfo->output_width;
    s32 ci;

    while (--num_rows >= 0) {
        for (ci = 0; ci < num_components; ci++) {
            inptr = input_buf[ci][input_row];
            outptr = output_buf[0] + ci;
            for (count = num_cols; count > 0; count--) {
                *outptr = *inptr++;
                outptr += num_components;
            }
        }
        input_row++;
        output_buf++;
    }
}
