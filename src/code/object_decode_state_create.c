#include "types.h"

/* IJG libjpeg 6a jdpostct.c: jinit_d_post_controller(). */

typedef unsigned int JDIMENSION;
typedef int boolean;
typedef struct jpeg_decompress_struct *j_decompress_ptr;
typedef struct jpeg_common_struct *j_common_ptr;
typedef void *jvirt_sarray_ptr;
typedef void **JSAMPARRAY;

struct jpeg_memory_mgr {
    void *(*alloc_small)(j_common_ptr, int, u32);
    u8 pad04[4];
    JSAMPARRAY (*alloc_sarray)(j_common_ptr, int, JDIMENSION, JDIMENSION);
    u8 pad0C[4];
    jvirt_sarray_ptr (*request_virt_sarray)(j_common_ptr, int, boolean,
                                            JDIMENSION, JDIMENSION, JDIMENSION);
};

struct jpeg_d_post_controller {
    void (*start_pass)(void);
};

typedef struct {
    struct jpeg_d_post_controller pub;
    u8 pad04[4];
    jvirt_sarray_ptr whole_image;
    JSAMPARRAY buffer;
    JDIMENSION strip_height;
    JDIMENSION starting_row;
    JDIMENSION next_row;
} my_post_controller;

typedef my_post_controller *my_post_ptr;

struct jpeg_decompress_struct {
    u8 pad00[4];
    struct jpeg_memory_mgr *mem;
    u8 pad08[0x4C];
    boolean quantize_colors;
    u8 pad58[0x18];
    JDIMENSION output_width;
    JDIMENSION output_height;
    int out_color_components;
    u8 pad7C[0xB8];
    int max_v_samp_factor;
    u8 pad138[0x74];
    struct jpeg_d_post_controller *post;
};

extern void func_8005CAC8(void);
extern long func_80063214(long, long);

void object_decode_state_create(j_decompress_ptr cinfo,
                                boolean need_full_buffer)
{
    my_post_ptr post;

    post = (my_post_ptr)(*cinfo->mem->alloc_small)
        ((j_common_ptr)cinfo, 1, sizeof(my_post_controller));
    cinfo->post = (struct jpeg_d_post_controller *)post;
    post->pub.start_pass = func_8005CAC8;
    post->whole_image = 0;
    post->buffer = 0;

    if (cinfo->quantize_colors) {
        post->strip_height = (JDIMENSION)cinfo->max_v_samp_factor;
        if (need_full_buffer) {
            post->whole_image = (*cinfo->mem->request_virt_sarray)
                ((j_common_ptr)cinfo, 1, 0,
                 cinfo->output_width * cinfo->out_color_components,
                 (JDIMENSION)func_80063214((long)cinfo->output_height,
                                           (long)post->strip_height),
                 post->strip_height);
        } else {
            post->buffer = (*cinfo->mem->alloc_sarray)
                ((j_common_ptr)cinfo, 1,
                 cinfo->output_width * cinfo->out_color_components,
                 post->strip_height);
        }
    }
}
