#include "types.h"

typedef struct ImagePlaneTransformContext ImagePlaneTransformContext;

typedef struct ImagePlaneEvent {
    void (*dispatch)(ImagePlaneTransformContext *context);
    u8 pad04[0x10];
    u32 type;
} ImagePlaneEvent;

typedef struct ImagePlaneAllocator {
    void *(*allocate)(ImagePlaneTransformContext *context, u32 count, u32 size);
    void *unused;
    void *(*allocate_plane)(ImagePlaneTransformContext *context, u32 count,
        u32 size, u32 rows);
} ImagePlaneAllocator;

typedef struct ImagePlaneDescriptor {
    u8 pad00[8];
    s32 horizontal;
    s32 vertical;
    u8 pad10[0x14];
    s32 scale;
    s32 method;
    u8 pad2C[4];
    s32 direct;
    u8 pad34[0x20];
} ImagePlaneDescriptor;

typedef struct ImagePlaneState {
    void (*decode[1])(void);
    void (*process[1])(void);
    s32 filtered;
    void *buffers[1];
    u8 pad10[0x24];
    s32 source_width[1];
    u8 pad38[0x2C];
    s32 source_rows[1];
    u8 pad68[0x24];
    u8 horizontal_ratio[1];
    u8 pad8D[9];
    u8 vertical_ratio[1];
} ImagePlaneState;

struct ImagePlaneTransformContext {
    ImagePlaneEvent *event;
    ImagePlaneAllocator *allocator;
    u8 pad008[0x18];
    s32 planes;
    u8 pad024[0x28];
    s32 high_quality;
    u8 pad050[0x20];
    s32 width;
    u8 pad074[0x64];
    ImagePlaneDescriptor *descriptors;
    u8 pad0DC[0x50];
    s32 error_pending;
    s32 output_width;
    s32 output_rows;
    s32 divisor;
    u8 pad13C[0x84];
    ImagePlaneState *state;
};

extern void func_8005EE88(void);
extern void image_plane_decode(void);
extern void func_8005F030(void);
extern void func_8005F038(void);
extern void image_rows_expand_repeated(void);
extern void func_8005F15C(void);
extern void image_rows_expand_horizontal(void);
extern void byte_plane_filter(void);
extern void image_plane_process(void);
extern s32 func_80063214(s32 width, s32 rows);

void image_plane_transform(ImagePlaneTransformContext *context)
{
    register ImagePlaneTransformContext *saved_context __asm__("$16");
    register ImagePlaneState *state __asm__("$21");
    register s32 quality_enabled __asm__("$22");
    register s32 plane __asm__("$20");
    register u8 *descriptor __asm__("$18");
    register u8 *state_plane __asm__("$17");
    u64 stack_padding;

    __asm__("" : "=r"(saved_context) : "0"(context));
    __asm__("" : : "m"(stack_padding));
    state = saved_context->allocator->allocate(saved_context, 1, 0xA0);
    saved_context->state = state;
    state->decode[0] = func_8005EE88;
    state->process[0] = image_plane_decode;
    state->filtered = 0;

    if (saved_context->error_pending != 0) {
        saved_context->event->type = 0x17;
        saved_context->event->dispatch(saved_context);
    }

    quality_enabled = 0;
    if (saved_context->high_quality != 0) {
        register s32 below_two __asm__("$2");

        below_two = saved_context->divisor < 2;
        quality_enabled = below_two ^ 1;
    }

    plane = 0;
    descriptor = (u8 *)saved_context->descriptors + 0x28;
    state_plane = (u8 *)state;
    if (saved_context->planes > 0) {
        do {
            s32 source_rows;
            s32 source_width;
            s32 output_width;
            s32 output_rows;
            s32 direct;
            s32 scale;
            register s32 allocate_buffer __asm__("$19") = 1;
            s32 same_width;
            register s32 same_rows __asm__("$4");
            s32 scaled_width;
            s32 scaled_width_matches;

            scale = *(s32 *)(descriptor - 4);
            source_rows = (*(s32 *)(descriptor - 0x1C)) * scale
                / saved_context->divisor;
            source_width = (*(s32 *)(descriptor - 0x20)) * scale
                / saved_context->divisor;
            output_width = saved_context->output_width;
            output_rows = saved_context->output_rows;
            *(s32 *)(state_plane + 0x64) = source_rows;
            direct = *(s32 *)(descriptor + 8);
            if (direct == 0) {
                *(void (**)(void))(state_plane + 0x34) = func_8005F038;
                allocate_buffer = 0;
            } else if ((same_rows = source_rows == output_rows) &
                       (same_width = source_width == output_width)) {
                *(void (**)(void))(state_plane + 0x34) = func_8005F030;
                allocate_buffer = 0;
            } else if ((scaled_width_matches =
                            (scaled_width = source_width * 2) == output_width) &
                       same_rows) {
                if (quality_enabled && *(u32 *)descriptor >= 3) {
                    *(void (**)(void))(state_plane + 0x34) = byte_plane_filter;
                } else {
                    *(void (**)(void))(state_plane + 0x34) = func_8005F15C;
                }
            } else if (scaled_width == output_width &&
                       source_rows * 2 == output_rows) {
                if (quality_enabled && *(u32 *)descriptor >= 3) {
                    *(void (**)(void))(state_plane + 0x34) = image_plane_process;
                    state->filtered = 1;
                } else {
                    *(void (**)(void))(state_plane + 0x34) =
                        image_rows_expand_horizontal;
                }
            } else {
                s32 width_ratio = output_width / source_width;
                s32 width_remainder = output_width % source_width;

                if (width_remainder == 0) {
                    s32 row_ratio = output_rows / source_rows;
                    s32 row_remainder = output_rows % source_rows;

                    if (row_remainder == 0) {
                        *(void (**)(void))(state_plane + 0x34) =
                            image_rows_expand_repeated;
                        *((u8 *)state + 0x8C + plane) = width_ratio;
                        *((u8 *)state + 0x96 + plane) = row_ratio;
                    } else {
                        goto invalid_scale;
                    }
                } else {
                    goto invalid_scale;
                }
            }

            goto scale_selected;
invalid_scale:
            saved_context->event->type = 0x25;
            saved_context->event->dispatch(saved_context);
scale_selected:

            if (allocate_buffer != 0) {
                s32 size = func_80063214(saved_context->width,
                    saved_context->output_width);
                *(void **)(state_plane + 0xC) =
                    saved_context->allocator->allocate_plane(saved_context, 1,
                        size, saved_context->output_rows);
            }
            state_plane += 4;
            plane++;
            descriptor += 0x54;
        } while (plane < saved_context->planes);
    }
}
