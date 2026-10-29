#include "types.h"

typedef struct {
    u8 pad[0x14];
    s32 unk14;
    s32 unk18;
    s32 unk1C;
    s32 unk20;
} State;

typedef struct {
    u8 pad[0x60];
    s32 unk60;
} Obj;

extern s32 D_80088090;
extern s32 D_8008931C;

State *func_800DD634(void);
s32 func_8000C8A0(s32);
void func_8000D874(s32, s32);
void func_8000D834(s32, s32);
void func_800D628C(Obj *);

void func_8009E68C(Obj *obj) {
    State *state = func_800DD634();
    s32 value = obj->unk60;

    func_8000D874(func_8000C8A0(D_80088090), value);
    func_8000D834(D_8008931C, value);
    state->unk1C = 0;
    state->unk20 = 0;
    state->unk14 = 0;
    state->unk18 = 0;
    func_800D628C(obj);
}
