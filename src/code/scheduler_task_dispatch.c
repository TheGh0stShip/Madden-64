#include "types.h"

typedef struct {
    /* 0x00 */ s32 unk_00[3];
    /* 0x0C */ s32 unk_0C;
    /* 0x10 */ s32 unk_10;
    /* 0x14 */ s32 unk_14;
} TransformRecord;

typedef struct {
    /* 0x00 */ s32 unk_00[8];
    /* 0x20 */ s32 unk_20[3];
} PartTable;

typedef struct {
    /* 0x00 */ u8 pad_00[8];
    /* 0x08 */ void *unk_08;
} Part;

typedef struct {
    /* 0x00 */ u8 pad_00[0x24];
    /* 0x24 */ Part **parts;
    /* 0x28 */ s32 unk_28;
    /* 0x2C */ u8 pad_2C[0x3C - 0x2C];
    /* 0x3C */ s32 scale;
    /* 0x40 */ s32 x;
    /* 0x44 */ s32 y;
    /* 0x48 */ s32 z;
    /* 0x4C */ u8 pad_4C[4];
    /* 0x50 */ u8 unk_50;
    /* 0x51 */ u8 unk_51;
} Figure;

typedef struct {
    u32 w0;
    u32 w1;
} GfxWords;

extern GfxWords *D_80084F5C;
extern s32 D_8008A3E0;
extern u16 D_8008A5B4;
extern u8 D_80074A64[];
extern PartTable D_8007A8E8[];
extern u8 D_00076D00[];
extern u8 D_00075D00[];
extern u8 D_00053398[];
extern u8 D_00050F78[];

void func_80008FA0(void);
void func_800093F4(s32 value);
void func_8000B184(u32 index, u32 value);
void display_frame_setup(void);
void display_command_update(void);
void vector_slots_initialize(s32 node_index);
void func_8000E3C8(void);
void vector_display_emit(void);
void matrix_stack_duplicate(void);
u32 stream_position_resolve(Figure *stream, u32 *result, u32 *secondary, u32 position, u32 frame);
void matrix_stack_scale_fixed(s32 x, s32 y, s32 z);
void display_command_finalize(TransformRecord *out, u32 a, u32 b, u8 index, u32 c);
void matrix_stack_transform_vector(TransformRecord *input);
void gameplay_record_update_tertiary(s32 value);
void gameplay_record_update_secondary(s32 value);
void gameplay_record_update_primary(s32 value);
void func_8002D398(void);
void matrix_stack_export_fixed(u8 *output);
void display_pipeline_setup(Part *object, u8 *segment, void *argument);
void func_8002CD28(void);

void scheduler_task_dispatch(Figure *figure, u32 position, u8 *matrices) {
    TransformRecord record;
    u32 result;
    u32 secondary;
    u16 idx;
    u16 i;
    u32 flags;

    idx = figure->unk_51;
    {
        GfxWords *g = D_80084F5C;
        D_80084F5C = g + 1;
        g->w0 = 0xE7000000;
        g->w1 = 0;
    }
    {
        GfxWords *g = D_80084F5C;
        D_80084F5C = g + 1;
        g->w0 = 0xB4000000;
        g->w1 = (u32)D_00076D00;
    }
    {
        GfxWords *g = D_80084F5C;
        D_80084F5C = g + 1;
        g->w0 = 0xAF0007FF;
        g->w1 = (u32)D_00053398;
    }
    func_80008FA0();
    display_frame_setup();
    display_command_update();
    vector_slots_initialize(D_8008A3E0);
    func_8000E3C8();
    vector_display_emit();
    func_800093F4(D_8007A8E8[idx].unk_20[figure->unk_50]);
    matrix_stack_duplicate();
    flags = stream_position_resolve(figure, &result, &secondary, position, D_8008A5B4) & 0xFF;
    matrix_stack_scale_fixed(figure->scale, figure->scale, figure->scale);
    i = 0;
    do {
        matrix_stack_duplicate();
        display_command_finalize(&record, result, secondary, i, flags);
        matrix_stack_transform_vector(&record);
        gameplay_record_update_tertiary(record.unk_14);
        gameplay_record_update_secondary(record.unk_10);
        gameplay_record_update_primary(record.unk_0C);
        func_8002D398();
        matrix_stack_scale_fixed(figure->x, figure->y, figure->z);
        matrix_stack_export_fixed(matrices + i * 64);
        if (i != 13) {
            func_8000B184(2, D_8007A8E8[idx].unk_00[D_80074A64[i]]);
        } else {
            func_8000B184(2, figure->unk_28);
        }
        display_pipeline_setup(figure->parts[i], matrices + i * 64, figure->parts[i]->unk_08);
        i++;
        func_8002CD28();
    } while (i < 14);
    func_8002CD28();
    {
        GfxWords *g = D_80084F5C;
        D_80084F5C = g + 1;
        g->w0 = 0xE7000000;
        g->w1 = 0;
    }
    {
        GfxWords *g = D_80084F5C;
        D_80084F5C = g + 1;
        g->w0 = 0xB4000000;
        g->w1 = (u32)D_00075D00;
    }
    {
        GfxWords *g = D_80084F5C;
        D_80084F5C = g + 1;
        g->w0 = 0xAF0007FF;
        g->w1 = (u32)D_00050F78;
    }
    func_80008FA0();
    display_frame_setup();
}
