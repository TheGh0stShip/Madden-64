#include "types.h"

typedef struct {
    u8 pad00[0x12];
    s16 unk_12;
    u8 pad14[0x24 - 0x14];
    u32 *unk_24;
    u8 pad28[0x3C - 0x28];
    s32 unk_3C;
    s32 unk_40;
    s32 unk_44;
    s32 unk_48;
} DisplayModel;

typedef struct {
    u8 pad00[0x8];
    DisplayModel *unk_08;
    u8 pad0C[0x18 - 0xC];
    u32 unk_18;
} DisplayObject;

typedef struct {
    u8 pad000[0x206];
    u16 unk_206;
} DisplayGlobals;

typedef struct {
    u8 pad00[0xC];
    s32 unk_0C;
    s32 unk_10;
    s32 unk_14;
} DisplayMatrix;

extern DisplayGlobals *D_8008B654;
extern u16 D_8008A5B4;
extern u8 D_800748F4[];
extern u8 *D_8007A560;
u32 object_vector_resolve(DisplayObject *, s32 *, s32, s32);
s32 display_context_update(DisplayObject *, s32 *, u16 *, s32);
void matrix_stack_duplicate(void);
void matrix_stack_transform_vector(void *);
u16 func_80043648(u8 *);
u8 stream_position_resolve(DisplayModel *, s32 **, u32 *, u32, u32);
void display_context_process(DisplayModel *, DisplayMatrix *, s32 *, u32, u32, u16);
void gameplay_record_update_primary(s32);
void gameplay_record_update_secondary(s32);
void gameplay_record_update_tertiary(s32);
void matrix_stack_scale_fixed(s32, s32, s32);
void display_command_finalize(DisplayMatrix *, s32 *, u32, u8, u8);
void func_8002D398(void);
u16 func_80043610(u32, u8 *);
void matrix_stack_export_fixed(u8 *);
void display_command_link(DisplayModel *, u8 *, u8);
void func_8002CD28(void);

void display_frame_dispatch(DisplayObject *arg0, u8 arg1) {
    DisplayModel *model;
    u32 flags;
    u32 angle;
    u32 shade;
    u16 i;
    u8 *mtx;
    DisplayMatrix matrix;
    s32 vec[4];
    u16 mode;
    s32 *entry;
    u32 position;

    model = arg0->unk_08;
    flags = D_8008B654->unk_206 & 0x100;
    angle = object_vector_resolve(arg0, vec, model->unk_12, flags);
    if (display_context_update(arg0, vec, &mode, flags) != 0) {
        return;
    }
    matrix_stack_duplicate();
    matrix_stack_transform_vector(vec);
    if (mode != 0) {
        mode = func_80043648(D_800748F4);
        if (mode == 8) {
            goto end;
        }
        if (mode >= 4) {
            mode = 1;
        } else {
            mode = 0;
        }
    }
    shade = stream_position_resolve(model, &entry, &position, arg0->unk_18, D_8008A5B4);
    if (arg1 && *entry == 0xF) {
        display_context_process(model, &matrix, entry, position, shade, angle);
    }
    gameplay_record_update_primary(0x400);
    gameplay_record_update_secondary((u16) angle);
    gameplay_record_update_tertiary(0);
    matrix_stack_scale_fixed(model->unk_3C, model->unk_3C, model->unk_3C);
    for (i = 0; i < 14; i++) {
        matrix_stack_duplicate();
        display_command_finalize(&matrix, entry, position, i, shade);
        matrix_stack_transform_vector(&matrix);
        gameplay_record_update_tertiary(matrix.unk_14);
        gameplay_record_update_secondary(matrix.unk_10);
        gameplay_record_update_primary(matrix.unk_0C);
        func_8002D398();
        matrix_stack_scale_fixed(model->unk_40, model->unk_44, model->unk_48);
        if (mode == 0 || func_80043610(model->unk_24[i], D_800748F4) == 0) {
            mtx = D_8007A560;
            D_8007A560 = mtx + 0x40;
            matrix_stack_export_fixed(mtx);
            display_command_link(model, mtx, i);
        }
        func_8002CD28();
    }
end:
    func_8002CD28();
}
