#include "types.h"

typedef struct {
    u8 pad00[0x84];
    void *unk84;
    u8 pad88[0x2C];
    s32 unkB4;
} Data;

typedef struct {
    u8 pad00[0x14];
    s32 unk14;
    s32 unk18;
    s32 unk1C;
    s32 unk20;
    u8 pad24[0x20];
    s32 unk44;
} Context;

typedef struct {
    u8 pad00[0x68];
    Data *data;
} Screen;

extern u16 D_80085BF8;
extern s32 D_80087AA8;
extern u16 D_800C3A14;
extern u16 D_800C3A68;

void func_8000BE80(void);
void func_8000D998(s32, s32);
void func_8000DA98(s32);
void func_80032F3C(s32, void *);
void func_80035F88(u16, u16);
u32 func_800364E4(u16, u16);
void func_80036540(s32);
void func_80092B98(void);
void func_800D628C(Screen *);
Context *func_800DD634(void);
void func_800DD788(s32);

void func_800A4624(Screen *arg0) {
    Screen *screen = arg0;
    Data *data;
    Context *context;
    s32 handle;

    func_80036540(0);
    func_8000BE80();
    data = screen->data;
    func_800DD788(0x11);
    func_80032F3C(0, data->unk84);
    context = func_800DD634();
    handle = context->unk44;
    context->unk14 = 0;
    context->unk18 = 0;
    context->unk1C = 0;
    context->unk20 = 0;
    if (handle != 0) {
        context->unk44 = 0;
        func_8000DA98(handle);
    }
    func_8000D998(D_80087AA8, data->unkB4);
    func_80032F3C(0, data);
    func_800D628C(screen);
    if (D_800C3A68 != 0) {
        func_80035F88(D_80085BF8, D_800C3A68);
        D_800C3A68 = 0;
    }
    if (D_800C3A14 != 0) {
        while ((func_800364E4(D_80085BF8, D_800C3A14) & 0x80000000) == 0) {
            func_80092B98();
        }
        func_80035F88(D_80085BF8, D_800C3A14);
        D_800C3A14 = 0;
    }
}
