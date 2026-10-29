#include "types.h"

typedef struct Overlay5CleanupState {
    u8 pad0[0x30];
    u8 object30[0x44];
    void* field74;
    u8 pad78[0x14];
    void* field8C;
} Overlay5CleanupState;

extern void* D_80086DD8;
extern u8 D_800908B8[];
extern void* D_8008931C;
extern void func_8003CE88(s32 kind, s32 value, s32 mode);
extern void func_8000D874(void* first, void* second);
extern void func_8000D834(void* first, void* second);
extern void func_8003E23C(void* object);

void func_800E1220(Overlay5CleanupState* state) {
    if (D_80086DD8 != D_800908B8) {
        func_8003CE88(0x29, 0x69, 0x10);
    } else {
        func_8003CE88(0x23, 0x69, 0x10);
    }
    func_8000D874(state->field74, state->field8C);
    func_8000D834(D_8008931C, state->field8C);
    state->field8C = 0;
    func_8003E23C(state->object30);
}
