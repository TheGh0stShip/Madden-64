#include "types.h"

/*
 * ui_resource_update: draw and animate one on-screen UI element (1-based `number`).
 *
 * Element positions and sizes are packed 12-bit signed values.  The element's model is placed,
 * and when it has an animation script the model is drawn at a position derived from its
 * size (converted to 16.16 fixed point) and scaled by its width, its animation advanced by
 * the frame time, and when the current script step's duration has elapsed the next menu
 * state is entered.  The catalogue name is kept.
 */

typedef struct UiScript {
    void **frames;
    u32 *durations;
} UiScript;

typedef struct UiAnim {
    u8 pad0[0x14];
    s32 flags;
    s32 frame;
    u8 pad1C[0x3C];
} UiAnim;

typedef struct UiElement {
    u16 x;
    u16 y;
    u8 width;
    u8 height;
    u8 model;
    UiScript *script;
    u8 step;
    UiAnim anim;
    u8 task[0x58];
    u32 elapsed;
    u8 buffers[2][0x380];
    s32 unk7C4;
} UiElement;

extern UiElement D_800784EC[];
extern s32 *D_8006929C;
extern s16 D_800692B4;
extern s16 D_800692B2;
extern u16 D_8008AFD4;
extern volatile u16 D_8008A5B4;
extern s32 D_8008B654;
extern f64 D_80000A48;

void func_80017000(s32, s16, s16);
void ui_scene_render(s32);
void object_display_segment_emit(s32);
void func_80044C6C(u16);
void func_8002CAD0(void);
void matrix_stack_transform_vector(s32 *);
void matrix_stack_scale_fixed(s32, s32, s32);
void gameplay_record_update_primary(s32);
void gameplay_record_update_secondary(s32);
void gameplay_record_update_tertiary(s32);
void scheduler_task_dispatch(void *, s32, void *);
void func_8002CD28(void);
void object_display_segment_enable(s32);
void memory_arena_update(UiAnim *, s32);
void menu_state_process(s32, UiScript *);
void func_80034388(UiAnim *, void *);

void ui_resource_update(s32 number) {
    s32 index = number - 1;
    s32 x;
    s32 y;
    s32 width;
    s32 height;
    s32 object;
    s32 scale;
    s32 vector[3];
    f64 fixed;
    UiScript *script;

    y = D_800784EC[index].y;
    x = D_800784EC[index].x;
    height = D_800784EC[index].height;
    width = D_800784EC[index].width;
    object = D_8006929C[D_800784EC[index].model];
    y &= 0xFFF;
    if (y & 0x800) {
        y |= ~0xFFF;
    }
    x &= 0xFFF;
    if (x & 0x800) {
        x |= ~0xFFF;
    }
    height &= 0xFFF;
    if (height & 0x800) {
        height |= ~0xFFF;
    }
    width &= 0xFFF;
    if (width & 0x800) {
        width |= ~0xFFF;
    }
    func_80017000(object, x, y);
    ui_scene_render(object);
    if (D_800784EC[index].script != 0) {
        object_display_segment_emit(D_8008B654);
        if (D_800692B4 != D_8008AFD4) {
            func_80044C6C(D_8008AFD4);
            D_800692B4 = D_8008AFD4;
        }
        scale = width * 404;
        func_8002CAD0();
        vector[2] = 300 << 16;
        vector[1] = (y + width * 5 / 6 - 120) * (fixed = D_80000A48);
        if (x >= 181) {
            if (height == 0x40 & width == 0x30) {
                vector[0] = (x + height * 4 / 5 - 180) * fixed;
            } else {
                vector[0] = (x + height * 2 / 3 - 180) * fixed;
            }
        } else {
            if (height == 0x30 & width == 0x40) {
                vector[0] = (x + height * 8 / 9 - 180) * fixed;
            } else {
                vector[0] = (x + height * 5 / 6 - 180) * fixed;
            }
        }
        matrix_stack_transform_vector(vector);
        matrix_stack_scale_fixed(scale, scale, scale);
        gameplay_record_update_primary(0x960);
        gameplay_record_update_secondary(x >= 181 ? 0xE10 : 0x194);
        gameplay_record_update_tertiary(0);
        scheduler_task_dispatch(D_800784EC[index].task, D_800784EC[index].anim.frame,
                                D_800784EC[index].buffers[D_8008AFD4]);
        func_8002CD28();
        object_display_segment_enable(D_8008B654);
        memory_arena_update(&D_800784EC[index].anim, D_8008A5B4);
        D_800784EC[index].elapsed += D_8008A5B4;
        if (D_800784EC[index].script != 0) {
            if (D_800692B2 != 0) {
                D_800784EC[index].elapsed = 0;
            }
            script = D_800784EC[index].script;
            if (script->durations[D_800784EC[index].step] < D_800784EC[index].elapsed) {
                menu_state_process(index, script);
                return;
            }
            if (!(D_800784EC[index].anim.flags & 0x20000)) {
                func_80034388(&D_800784EC[index].anim, script->frames[D_800784EC[index].step]);
            }
        }
    }
}
