/* IJG libjpeg 6a jquant1.c: create_odither_tables(). */
#include "types.h"

typedef struct jpeg_decompress_struct *j_decompress_ptr;

typedef struct {
    void *start_pass;
    void *color_quantize;
    void *finish_pass;
    void *new_color_map;
} jpeg_color_quantizer;

typedef struct {
    jpeg_color_quantizer pub;
    void *sv_colormap;
    s32 sv_actual;
    void *colorindex;
    s32 is_padded;
    s32 Ncolors[4];
    s32 row_index;
    void *odither[4];
    void *fserrors[4];
    s32 on_odd_row;
} my_cquantizer;

struct jpeg_decompress_struct {
    u8 pad000[0x78];
    s32 out_color_components;
    u8 pad07C[0x14C];
    my_cquantizer *cquantize;
};

extern void *func_8006056C(j_decompress_ptr cinfo, s32 ncolors);

void object_shared_buffers_assign(j_decompress_ptr cinfo)
{
    my_cquantizer *cquantize = cinfo->cquantize;
    void *odither;
    s32 i;
    s32 j;
    s32 nci;

    for (i = 0; i < cinfo->out_color_components; i++) {
        nci = cquantize->Ncolors[i];
        odither = 0;
        for (j = 0; j < i; j++) {
            if (nci == cquantize->Ncolors[j]) {
                odither = cquantize->odither[j];
                break;
            }
        }
        if (odither == 0)
            odither = func_8006056C(cinfo, nci);
        cquantize->odither[i] = odither;
    }
}
