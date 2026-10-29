#include "types.h"

typedef struct {
    u8 active;
    u8 mode;
    u8 pad02[6];
    s32 handles[7];
    s32 unk24;
    void *unk28;
    s32 unk2C;
    u8 unk30[1];
} State;

typedef struct {
    u8 pad00[0x60];
    State *state;
} Screen;

typedef struct {
    u8 pad00[0x14];
    s32 unk14;
    s32 unk18;
    u8 pad1C[0x28];
    s32 unk44;
    s32 unk48;
    s32 unk4C;
    s32 unk50;
    s32 unk54;
    s32 unk58;
} Context;

extern s32 D_80087A64;
extern s32 D_80087AA4;
extern s32 D_80087AA8;
extern s32 D_8008931C;

void func_8000C940(s32, s32, s32);
void func_8000C964(s32, s32, s32);
void func_8000D834(s32, s32);
void func_8000D874(s32, s32);
void func_80016FF4(s32);
void func_80032F3C(s32, void *);
void func_8003E23C(void *);
void func_800D57CC(void);
Context *func_800DD634(void);
void func_800E078C(s32);

void func_800A6A58(Screen *screen) {
    State *state = screen->state;
    Context *context = func_800DD634();
    u32 i;

    if (state->active == 0) {
        if (state->mode != 2) {
            if (context->unk48 != 0) {
                func_80016FF4(context->unk48);
                func_8000D834(D_8008931C, context->unk48);
                context->unk48 = 0;
            }
            if (context->unk50 != 0) {
                func_80016FF4(context->unk50);
                func_8000D834(D_8008931C, context->unk50);
                context->unk50 = 0;
            }
            for (i = 0; i < 6; i++) {
                func_8000D874(D_80087AA8, state->handles[i]);
                func_8000D834(D_8008931C, state->handles[i]);
            }
            func_8000D834(D_8008931C, context->unk54);
            context->unk54 = 0;
            context->unk58 = 0;
        } else {
            func_8000D834(D_8008931C, context->unk48);
            func_8000D834(D_8008931C, context->unk44);
            context->unk44 = 0;
            context->unk48 = 0;
            context->unk14 = 0;
            context->unk18 = 0;
            func_800E078C(state->unk2C);
            func_8003E23C(state->unk30);
            func_80032F3C(0, state->unk28);
            func_8000D874(D_80087A64, state->unk24);
            func_8000D834(D_8008931C, state->unk24);
        }
    }
    func_800D57CC();
    context->unk44 = 0;
    context->unk4C = 0;
    func_8000C940(D_80087AA4, 0, 0);
    func_8000C964(D_80087AA4, 0x140, 0xF0);
    func_80032F3C(0, state);
}
