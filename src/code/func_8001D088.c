#include "types.h"

typedef struct {
    u8 pad[0x1A];
    u16 width;
} Meta;

typedef struct {
    u8 pad[8];
    Meta *meta;
} Object;

extern s32 func_8004DF94(u8 *);
extern void func_80033308(s32, u8 *, u32, u8);
extern u16 func_8001E820(u8 *, s32, s32, s32);
extern void func_8001E8F0(s8, s32, Object *, u8 *, u8 *, s32, s32);
extern s8 D_80085027;

void func_8001D088(Object *object, u8 *dst, u8 *src, s32 arg3) {
    u8 *data;
    u8 *saved_data;
    u16 width;
    u8 marker;
    s32 fill;
    s32 stride;
    s32 i;
    u16 amount;
    s8 start;

    data = src + 1;
    width = object->meta->width;
    i = func_8004DF94(data);
    saved_data = data;
    data += i + 0xC;
    marker = *data;
    fill = 0xDD;
    if (marker != 0) {
        fill = (-(marker >> 7) & ~0x22) | 0xCC;
    }
    stride = width;
    func_80033308(0, dst, (u32)(stride * 7) >> 1, fill);
    fill = 0;
    do {
        dst[((u8)fill * stride) >> 1] = 0;
        fill++;
    } while ((u8)fill < 7);

    data = saved_data;
    amount = func_8001E820(data, arg3, 0, 9);
    if (amount >= 0x58) {
        start = 4;
    } else {
        start = ((0x58 - amount) / 2) + 2;
    }
    D_80085027 = 0;
    func_8001E8F0(start, 6, object, dst, data, arg3, 9);
}
