#include "types.h"

typedef u16 HistCell;
typedef HistCell HistRow[32];
typedef HistRow *Hist2D;

typedef struct {
    u8 unk_00[0x18];
    Hist2D *histogram;
} QuantizeState;

typedef struct {
    u8 unk_00[0x70];
    u32 output_width;
    u8 unk_74[0x154];
    QuantizeState *cquantize;
} DecodeObject;

extern void func_80061F10(DecodeObject *object, s32 c0, s32 c1, s32 c2);

void object_lookup_indices_decode(DecodeObject *object, u8 **input_buf, u8 **output_buf, s32 num_rows)
{
    QuantizeState *cquantize = object->cquantize;
    Hist2D *histogram = cquantize->histogram;
    register u8 *inptr;
    register u8 *outptr;
    register HistCell *cachep;
    register s32 c0, c1, c2;
    s32 row;
    u32 col;
    u32 width = object->output_width;

    for (row = 0; row < num_rows; row++) {
        inptr = input_buf[row];
        outptr = output_buf[row];
        for (col = width; col > 0; col--) {
            c0 = *inptr++ >> 3;
            c1 = *inptr++ >> 2;
            c2 = *inptr++ >> 3;
            cachep = &histogram[c0][c1][c2];
            if (*cachep == 0) {
                func_80061F10(object, c0, c1, c2);
            }
            *outptr++ = (u8)(*cachep - 1);
        }
    }
}
