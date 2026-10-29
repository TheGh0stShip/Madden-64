#include "types.h"

typedef struct Overlay5AllocatedState {
    u8 pad0[0x10];
    s32 field10;
    u8 pad14[8];
    u8 object1C[0x50];
    void* field6C;
    u8 pad70[3];
    u8 field73;
    s32 field74;
    s32 field78;
    u16 field7C;
} Overlay5AllocatedState;

typedef struct Overlay5AllocatedOwner {
    u8 pad0[0xC];
    Overlay5AllocatedState* state;
} Overlay5AllocatedOwner;

typedef struct Overlay5AllocatedInput {
    u8 pad0[0xC];
    u8 valueC;
} Overlay5AllocatedInput;

extern void* func_80032E00(s32 value, s32 size);
extern void func_800DF19C(Overlay5AllocatedOwner* owner,
                          Overlay5AllocatedInput* input, u8 first,
                          u8 second, s32 extra);
extern void* func_800E06C4(s32 value, void* object);
extern void func_800E0928(void* object, s32 value, s32 extra);

void func_800DE900(Overlay5AllocatedOwner* owner,
                   Overlay5AllocatedInput* input) {
    Overlay5AllocatedState* state = func_80032E00(0, 0x80);
    u8 value;

    owner->state = state;
    state->field78 = 0;
    state->field74 = 0;
    state->field73 = 0;
    state->field7C = 0;
    state->field10 = 0;

    value = input->valueC;
    func_800DF19C(owner, input, value, value, 0);
    state->field6C = func_800E06C4(1, state->object1C);
    func_800E0928(state->field6C, 1, 0);
}
