/* IJG libjpeg 6a jquant1.c: select_ncolors(). */
#include "types.h"

typedef struct jpeg_decompress_struct *j_decompress_ptr;
typedef struct jpeg_common_struct *j_common_ptr;

typedef struct jpeg_error_mgr {
    void (*error_exit)(j_common_ptr cinfo);
    void *other[4];
    s32 msg_code;
    union { s32 i[8]; char s[80]; } msg_parm;
} jpeg_error_mgr;

struct jpeg_decompress_struct {
    jpeg_error_mgr *err;
    u8 pad004[0x24];
    s32 out_color_space;
    u8 pad02C[0x34];
    s32 desired_number_of_colors;
    u8 pad064[0x14];
    s32 out_color_components;
};
struct jpeg_common_struct { jpeg_error_mgr *err; };

extern const s32 D_80003518[3];

s32 image_table_finalize(j_decompress_ptr cinfo, s32 Ncolors[])
{
    s32 nc = cinfo->out_color_components;
    s32 max_colors = cinfo->desired_number_of_colors;
    s32 total_colors;
    s32 iroot;
    s32 i;
    s32 j;
    s32 changed;
    s32 temp;

    iroot = 1;
    do {
        iroot++;
        temp = iroot;
        for (i = 1; i < nc; i++)
            temp *= iroot;
    } while (temp <= max_colors);
    iroot--;

    if (iroot < 2) {
        cinfo->err->msg_code = 0x37;
        cinfo->err->msg_parm.i[0] = temp;
        (*cinfo->err->error_exit)((j_common_ptr)cinfo);
    }

    total_colors = 1;
    for (i = 0; i < nc; i++) {
        Ncolors[i] = iroot;
        total_colors *= iroot;
    }

    do {
        changed = 0;
        for (i = 0; i < nc; i++) {
            j = (cinfo->out_color_space == 2 ? D_80003518[i] : i);
            temp = total_colors / Ncolors[j];
            temp *= Ncolors[j] + 1;
            if (temp > max_colors)
                break;
            Ncolors[j]++;
            total_colors = temp;
            changed = 1;
        }
    } while (changed);

    return total_colors;
}
