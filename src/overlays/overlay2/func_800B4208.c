#include "types.h"

typedef struct {
    void *line0;
    void *line1;
    void *line2;
    u8 padC[0x14];
} Request;

typedef struct {
    s16 *slots;
} Roster;

typedef struct {
    u8 pad0[2];
    u16 team;
    u8 pad4[2];
    u16 index;
    Roster *roster;
    u8 padC[2];
    u16 money;
} Context;

typedef struct {
    u8 pad0[0x1C];
    s32 unk1C;
    s32 unk20;
} State;

typedef struct {
    u8 pad0[0x2D];
    u8 unk2D;
} Panel;

typedef struct {
    u8 pad0[0xC];
    Panel *panel;
} Holder;

typedef struct {
    u8 pad0[0x24];
    Holder *holder;
    u8 pad28[0x38];
    Context *context;
} Screen;

extern s16 D_80073D68;
extern u16 D_800BDF0A;
extern u8 D_800C3260[];
extern u8 D_800C3278[];
extern u8 D_800C3290[];
extern u8 D_800C3320[];
extern u8 D_800C3338[];

State *func_800DD634(void);
void func_800B411C(Screen *);
void func_800B4078(Context *);
u16 func_800AF1D4(s32);
s16 func_800B456C(Request *, s16);
u16 func_80039F08(s32, u16, s32);
void func_80024E9C(void);
void func_80024694(void);
void func_800B478C(Screen *, u16);
void func_800B446C(Context *);
u16 func_8003A1D0(void);
void func_800AF0DC(Screen *, u16, s32);
void func_800B45D0(Screen *);
void func_80016FF4(s32);
void func_800D67B8(Request *);
void func_800D6454(Request *);

void func_800B4208(Screen *screen) {
    Context *ctx = screen->context;
    Roster *roster = ctx->roster;
    State *state = func_800DD634();
    Panel *panel = screen->holder->panel;
    Request req;

    func_800B411C(screen);
    func_800B4078(ctx);
    if (ctx->money >= 0x6EF && D_80073D68 == 1) {
        goto too_rich;
    }
    if (func_800AF1D4(0) >= 0x36) {
        goto full;
    }
    if (func_800B456C(&req, roster->slots[ctx->index]) != 0) {
        return;
    }
    if (func_80039F08(0, roster->slots[ctx->index], 1) == 0) {
        return;
    }
    func_80024E9C();
    func_80024694();
    func_800B478C(screen, ctx->team);
    func_800B446C(ctx);
    func_800AF0DC(screen, func_8003A1D0(), 7);
    func_800B45D0(screen);
    D_800BDF0A = ctx->team;
    if (func_8003A1D0() == 0) {
        func_80016FF4(state->unk1C);
        func_80016FF4(state->unk20);
        panel->unk2D = 0xFF;
    }
    return;
full:
    func_800D67B8(&req);
    req.line0 = D_800C3260;
    req.line1 = D_800C3278;
    req.line2 = D_800C3290;
    func_800D6454(&req);
    return;
too_rich:
    func_800D67B8(&req);
    req.line0 = D_800C3320;
    req.line1 = D_800C3338;
    func_800D6454(&req);
}
