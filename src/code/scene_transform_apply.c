#include "types.h"

typedef struct TransformSource {
    u8 pad0[18];
    s16 angle;
    u8 pad14[40];
    s32 distance;
} TransformSource;

typedef struct TransformObject {
    u8 pad0[8];
    TransformSource *source;
    u8 padC[16];
    u8 position[1];
} TransformObject;

typedef struct TransformWords {
    u32 word0;
    u32 word1;
    u32 word2;
    u32 word3;
} TransformWords;

typedef union ProductWords {
    s64 value;
    struct {
        u32 high;
        u32 low;
    } words;
} ProductWords;

extern TransformWords D_8000300C;
extern void func_8002CAD0(void);
extern void func_8002DA14(void *value);
extern void func_8002CD44(s32 value);
extern void func_8002CF48(s32 value);
extern void func_8002D14C(s32 value);
extern void func_8002D8D0(u32 x, u32 y, u32 z);
extern void func_8002DBD0(TransformWords *words, void *output);
extern void func_8002CD28(void);

void func_80043E7C(TransformObject *object, void *output, u32 alternate)
{
    register TransformObject *saved_object __asm__("$17") = object;
    register void *saved_output __asm__("$19") = output;
    register TransformSource *source __asm__("$18");
    register s32 angle __asm__("$16");
    register TransformWords *words __asm__("$20");
    TransformWords local;
    ProductWords product;
    register u32 high __asm__("$14");
    register u32 low __asm__("$15");
    register u32 scaled __asm__("$4");

    __asm__("" : "=r"(saved_object), "=r"(saved_output)
            : "0"(saved_object), "1"(saved_output));
    local = D_8000300C;
    source = saved_object->source;
    angle = -source->angle;
    words = &local;
    if ((u16)alternate == 0) {
        angle += 0x800;
    }

    func_8002CAD0();
    func_8002DA14(saved_object->position);
    func_8002CD44(0x400);
    func_8002CF48(angle);
    func_8002D14C(0);
    source = (TransformSource *)(u32)source->distance;
    product.value = (s64)(s32)(u32)source * 0x00355555;
    high = product.words.high;
    low = product.words.low;
    scaled = (high << 16) | (low >> 16);
    func_8002D8D0(scaled, scaled, scaled);
    func_8002DA14(saved_output);
    func_8002DBD0(words, saved_output);
    func_8002CD28();
}
