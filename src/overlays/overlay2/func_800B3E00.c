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

extern u16 D_80084F40;
extern s32 D_800C48B8[];

State *func_800DD634(void);
u16 func_80016FD4(void);
void func_80016FC4(u16);
void func_80017B80(s32);

void func_800B3E00(Item *item) {
    u16 saved;
    State *state;

    state = func_800DD634();
    saved = func_80016FD4();
    func_80016FC4(D_80084F40);
    if (item->kind == 0) {
        state->texture = D_800C48B8[item->id];
        func_80017B80(state->texture);
    } else if (item->kind == 1) {
        state->texture = D_800C48B8[item->id];
        func_80017B80(state->texture);
    }
    func_80016FC4(saved);
}
