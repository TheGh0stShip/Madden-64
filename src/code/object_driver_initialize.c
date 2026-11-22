#include "types.h"

typedef struct ObjectDriverError {
    void (*error_exit)(void *object);
    void (*emit_message)(void *object, s32 level);
    u8 pad08[0xC];
    s32 msg_code;
    s32 msg_parm[8];
} ObjectDriverError;

typedef struct ObjectDriverComponent {
    s32 component_id;
    u8 pad04[0x50];
} ObjectDriverComponent;

typedef struct ObjectDriver {
    ObjectDriverError *err;
    u8 pad04[0x1C];
    s32 num_components;
    s32 jpeg_color_space;
    s32 out_color_space;
    u32 scale_num;
    u32 scale_denom;
    u8 pad34[4];
    f64 output_gamma;
    s32 buffered_image;
    s32 raw_data_out;
    s32 dct_method;
    s32 do_fancy_upsampling;
    s32 do_block_smoothing;
    s32 quantize_colors;
    s32 dither_mode;
    s32 two_pass_quantize;
    s32 desired_number_of_colors;
    s32 enable_1pass_quant;
    s32 enable_external_quant;
    s32 enable_2pass_quant;
    u8 pad70[0x18];
    void *colormap;
    u8 pad8C[0x4C];
    ObjectDriverComponent *comp_info;
    u8 padDC[0x3C];
    s32 saw_JFIF_marker;
    u8 pad11C[8];
    s32 saw_Adobe_marker;
    u8 Adobe_transform;
} ObjectDriver;

void object_driver_initialize(ObjectDriver *cinfo) {
    switch (cinfo->num_components) {
    case 1:
        cinfo->jpeg_color_space = 1;
        cinfo->out_color_space = 1;
        break;
    case 3:
        if (cinfo->saw_JFIF_marker) {
            cinfo->jpeg_color_space = 3;
        } else if (cinfo->saw_Adobe_marker) {
            switch (cinfo->Adobe_transform) {
            case 0:
                cinfo->jpeg_color_space = 2;
                break;
            case 1:
                cinfo->jpeg_color_space = 3;
                break;
            default:
                cinfo->err->msg_code = 0x6E;
                cinfo->err->msg_parm[0] = cinfo->Adobe_transform;
                (*cinfo->err->emit_message)(cinfo, -1);
                cinfo->jpeg_color_space = 3;
                break;
            }
        } else {
            s32 cid0 = cinfo->comp_info[0].component_id;
            s32 cid1 = cinfo->comp_info[1].component_id;
            s32 cid2 = cinfo->comp_info[2].component_id;

            if (cid0 == 1 && cid1 == 2 && cid2 == 3) {
                cinfo->jpeg_color_space = 3;
            } else if (cid0 == 82 && cid1 == 71 && cid2 == 66) {
                cinfo->jpeg_color_space = 2;
            } else {
                do {
                    s32 *_mp = cinfo->err->msg_parm;
                    _mp[0] = cid0;
                    _mp[1] = cid1;
                    _mp[2] = cid2;
                    cinfo->err->msg_code = 0x6B;
                    (*cinfo->err->emit_message)(cinfo, 1);
                } while (0);
                cinfo->jpeg_color_space = 3;
            }
        }
        cinfo->out_color_space = 2;
        break;
    case 4:
        if (cinfo->saw_Adobe_marker) {
            switch (cinfo->Adobe_transform) {
            case 0:
                cinfo->jpeg_color_space = 4;
                break;
            case 2:
                cinfo->jpeg_color_space = 5;
                break;
            default:
                cinfo->err->msg_code = 0x6E;
                cinfo->err->msg_parm[0] = cinfo->Adobe_transform;
                (*cinfo->err->emit_message)(cinfo, -1);
                cinfo->jpeg_color_space = 5;
                break;
            }
        } else {
            cinfo->jpeg_color_space = 4;
        }
        cinfo->out_color_space = 4;
        break;
    default:
        cinfo->jpeg_color_space = 0;
        cinfo->out_color_space = 0;
        break;
    }

    cinfo->scale_num = 1;
    cinfo->scale_denom = 1;
    cinfo->output_gamma = 1.0;
    cinfo->buffered_image = 0;
    cinfo->raw_data_out = 0;
    cinfo->dct_method = 0;
    cinfo->do_fancy_upsampling = 1;
    cinfo->do_block_smoothing = 1;
    cinfo->quantize_colors = 0;
    cinfo->dither_mode = 2;
    cinfo->two_pass_quantize = 1;
    cinfo->desired_number_of_colors = 256;
    cinfo->colormap = 0;
    cinfo->enable_1pass_quant = 0;
    cinfo->enable_external_quant = 0;
    cinfo->enable_2pass_quant = 0;
}
