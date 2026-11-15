#include "types.h"

typedef struct {
    u8 pad0[0x14];
    s32 field14;
    s32 field18;
    s32 field1C;
    s32 field20;
    u8 pad24[0x24];
    void *field48;
} Runtime;

typedef struct {
    u8 pad0[0xC];
    void *fieldC;
    void *field10;
    u8 pad14[4];
    void *field18;
    u8 pad1C[4];
    void *field20;
    u8 pad24[4];
    void *field28;
} State;

typedef struct {
    u8 pad0[0x24];
    void *field24;
    void *field28;
    u8 pad2C[0xC];
    void *field38;
    u8 pad3C[0x24];
    State *state;
} Context;

Runtime *func_800DD634(void);
void func_80017C24(void *);
void func_800DD788(s32);
void func_80032F3C(s32, void *);
void func_800D628C(Context *);
void func_80024E9C(void);

void func_800B1300(Context *ctx) {
    Context *context;
    State *state;
    Runtime *runtime;

    context = ctx;
    runtime = func_800DD634();
    state = context->state;
    runtime->field14 = 0;
    runtime->field18 = 0;
    runtime->field1C = 0;
    runtime->field20 = 0;
    func_80017C24(runtime->field48);
    runtime->field48 = 0;
    func_800DD788(0x12);
    func_800DD788(8);
    func_800DD788(9);
    func_800DD788(10);
    func_800DD788(11);
    if (state->fieldC != 0) {
        func_80032F3C(0, state->fieldC);
    }
    if (state->field10 != 0) {
        func_80032F3C(0, state->field10);
    }
    func_800D628C(context);
    context->field28 = state->field18;
    context->field38 = state->field20;
    context->field24 = state->field28;
    func_800D628C(context);
    func_80024E9C();
    func_80032F3C(0, state);
}
