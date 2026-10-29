#include "types.h"

typedef struct {
    u8 pad00[0x3C];
    s32 unk3C;
    u8 pad40[0x20];
    s32 *list;
} Screen;

typedef struct {
    u8 pad00[0x44];
    s32 slots[19];
} Context;

extern s32 D_80087AA8;
extern s32 D_8008931C;

Context *func_800DD634(void);
void func_8000D874(s32, s32);
void func_8000D834(s32, s32);
void func_80032F3C(s32, void *);
void func_800DD648(s32);

void func_800A7EFC(Screen *screen) {
    s32 *list = screen->list;
    Context *context = func_800DD634();
    u16 i;

    func_8000D874(D_80087AA8, screen->unk3C);
    func_8000D834(D_8008931C, screen->unk3C);
    for (i = 0; i < 8; i++) {
        func_8000D834(D_8008931C, list[i]);
    }
    for (i = 0; i < 19; i++) {
        context->slots[i] = 0;
    }
    func_80032F3C(0, list);
    func_800DD648(-1);
}
