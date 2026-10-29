#include "types.h"

typedef struct {
    s8 unk00;
    s8 unk01;
    s8 unk02;
} Buffer;

typedef struct {
    u8 pad00[0x60];
    Buffer *buffer;
    u8 pad64[0x10];
    s32 count;
    s32 items[0xB5];
} Screen;

typedef struct {
    u8 pad00[0x44];
    s32 unk44;
    u8 pad48[4];
    s32 unk4C;
} Context;

extern s32 D_80087AA4;

void func_8000C940(s32, s32, s32);
void func_8000C964(s32, s32, s32);
void *func_80032E00(s32, s32);
void func_800D54E4(s32);
Context *func_800DD634(void);

void func_800A6874(Screen *screen) {
    Context *context;
    Buffer *buffer;
    u32 i;
    s32 *list;
    s32 *p;

    context = func_800DD634();
    screen->count = 0xB5;
    i = 0;
    list = &screen->count;
    p = list;
    do {
        p[1] = 0;
        i++;
        p++;
    } while (i < 0xB4);
    list[i + 1] = 0;
    buffer = func_80032E00(0, 0xD8);
    screen->buffer = buffer;
    buffer->unk02 = 0;
    buffer->unk00 = 0;
    func_8000C940(D_80087AA4, 0x1B, 0x41);
    func_8000C964(D_80087AA4, 0x125, 0xAF);
    context->unk44 = 0;
    context->unk4C = 0;
    func_800D54E4(2);
}
