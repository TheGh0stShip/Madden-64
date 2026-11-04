#include "types.h"

typedef struct StateD83F8 {
    u8 pad00[0x4C];
    void *field4C;
    u8 pad50[4];
    void *field54;
    void *field58;
    void *field5C;
    void *field60;
} StateD83F8;

typedef struct ObjectD83F8 {
    u8 pad00[0x3C];
    void *resources[1];
    u8 pad40[0x24];
    void *field64;
} ObjectD83F8;

extern void *D_80085C30[8];
extern void *D_8008A758[6];
extern void *D_80088090;
extern void *D_8008931C;
extern void *D_80087AA8;
extern u16 D_80086DA8;
extern s32 D_800E6C28;
extern u8 D_800E5EB0;

extern StateD83F8 *func_800DD634(void);
extern void *func_8000C8A0(void *owner);
extern void func_8000D874(void *owner, void *resource);
extern void func_8000D834(void *owner, void *resource);
extern void func_80032F3C(s32 pool, void *memory);
extern void func_80017C24(void *memory);
extern void func_800DD788(s32 value);
extern u16 func_80016FD4(void);
extern void func_80035F88(u16 value, s32 sound);

void func_800D83F8(ObjectD83F8 *object) {
    StateD83F8 *state;
    u16 i;

    state = func_800DD634();
    for (i = 0; i < 8; i++) {
        func_8000D874(func_8000C8A0(D_80088090), D_80085C30[i]);
        func_8000D834(D_8008931C, D_80085C30[i]);
    }
    for (i = 0; i < 6; i++) {
        func_80032F3C(0, D_8008A758[i]);
    }
    func_80032F3C(0, object->field64);
    if (D_800E6C28 == 1) {
        func_80017C24(state->field4C);
        func_80017C24(state->field60);
    }
    state->field4C = 0;
    state->field60 = 0;
    for (i = 0; i < (u16)(D_80086DA8 + 1); i++) {
        func_8000D874(D_80087AA8, object->resources[i]);
        func_8000D834(D_8008931C, object->resources[i]);
    }
    func_800DD788(0x13);
    func_800DD788(0x14);
    func_800DD788(0x15);
    func_800DD788(0x16);
    if (D_800E6C28 == 2) {
        func_80035F88(func_80016FD4(), 0x8F);
    }
    state->field54 = 0;
    state->field58 = 0;
    state->field5C = 0;
    D_800E5EB0 = 0;
}
