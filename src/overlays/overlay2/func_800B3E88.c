#include "types.h"

typedef struct {
    u8 pad00[0x48];
    s32 texture;
} State;

typedef struct {
    u8 kind;
    u8 pad01;
    u16 id;
} Item;

typedef struct {
    u8 pad00[0x60];
    Item *item;
} Owner;

extern u16 D_80084F40;
extern s32 D_800C48B8[];

State *func_800DD634(void);
u16 func_80016FD4(void);
void func_80016FC4(u16);
void func_80017B80(s32);
void func_80017C24(s32);
void func_80092B98(void);

void func_800B3E88(Owner *owner) {
    Item *item;
    State *state;
    u16 saved;
    s32 old;

    state = func_800DD634();
    item = owner->item;
    saved = func_80016FD4();
    func_80016FC4(D_80084F40);
    if (item->kind == 0) {
        goto swap;
    } else if (item->kind == 1) {
    swap:
        old = state->texture;
        state->texture = 0;
        func_80092B98();
        func_80092B98();
        func_80017C24(old);
        state->texture = D_800C48B8[item->id];
        func_80017B80(state->texture);
    }
    func_80016FC4(saved);
}
