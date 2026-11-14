/* IJG libjpeg 6a jquant1.c: alloc_fs_workspace(). */
#include "types.h"

typedef u32 size_t;
typedef u32 JDIMENSION;
typedef s16 FSERROR;
typedef FSERROR *FSERRPTR;
typedef struct jpeg_common_struct *j_common_ptr;

typedef void *(*alloc_large_method)(j_common_ptr cinfo, s32 pool_id,
                                    size_t sizeofobject);
struct jpeg_memory_mgr {
    void *alloc_small;
    alloc_large_method alloc_large;
};

typedef struct {
    void *pub[4];
    void *sv_colormap;
    s32 sv_actual;
    void *colorindex;
    s32 is_padded;
    s32 Ncolors[4];
    s32 row_index;
    void *odither[4];
    FSERRPTR fserrors[4];
    s32 on_odd_row;
} my_cquantizer;

typedef struct jpeg_decompress_struct {
    void *err;
    struct jpeg_memory_mgr *mem;
    u8 pad008[0x68];
    JDIMENSION output_width;
    u8 pad074[4];
    s32 out_color_components;
    u8 pad07C[0x14C];
    my_cquantizer *cquantize;
} jpeg_decompress_struct;
typedef jpeg_decompress_struct *j_decompress_ptr;

void object_children_allocate(j_decompress_ptr cinfo)
{
    my_cquantizer *cquantize = cinfo->cquantize;
    size_t arraysize;
    s32 i;

    arraysize = (size_t)((cinfo->output_width + 2) * sizeof(FSERROR));
    for (i = 0; i < cinfo->out_color_components; i++) {
        cquantize->fserrors[i] = (FSERRPTR)
            (*cinfo->mem->alloc_large)((j_common_ptr)cinfo, 1, arraysize);
    }
}
