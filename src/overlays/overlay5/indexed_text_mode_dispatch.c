#include "types.h"

typedef struct Overlay5ShortSuffix {
    u8 bytes[5];
} Overlay5ShortSuffix;

typedef struct Overlay5TextContext {
    u8 pad00[0x60];
    u8 *data;
} Overlay5TextContext;

extern Overlay5ShortSuffix SHORT_SUFFIX;
extern void *POINTERS[];
void func_800167FC(s16 value, u8 *text);
void func_8002E688(void *destination, void *source);
void func_8002E65C(void *destination, void *source);

void overlay5_indexed_text_mode_dispatch(
    s32 index,
    s32 mode,
    u8 *text,
    Overlay5TextContext *context
) {
    Overlay5ShortSuffix suffix = SHORT_SUFFIX;
    u8 *data = context->data;

    if (mode == 1) {
        goto mode_one;
    }
    if (mode == 0) {
        goto mode_zero;
    }
    if (mode == 2) {
        goto mode_two;
    }
    goto done;

mode_zero:
    func_8002E65C(text, POINTERS[index]);
    goto done;

mode_one:
    func_800167FC(*(s16 *)(data + index * 2 + 0xEE), text);
    if ((u32)index < 9) {
        func_8002E688(text, &suffix);
    }
    goto done;

mode_two:
    func_8002E65C(text, data + index * 17);

done:
    return;
}
