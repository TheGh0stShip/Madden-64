#include "types.h"

typedef struct AudioRecord {
    s32 value;
    u8 first;
    u8 second;
    u8 third;
    u8 fourth;
    u8 fifth;
} AudioRecord;

typedef struct AudioState {
    u8 pad0[0x28];
    void* target;
    u8 pad2C[0x24];
    u8 first;
    u8 second;
    u8 third;
} AudioState;

typedef struct AudioOwner {
    u8 pad0[8];
    AudioState* state;
} AudioOwner;

extern void func_80044270(AudioState* state, u8 first, u8 second);
extern void func_8004256C(void* target, u8 second, u8 fifth, s32 value);

void func_800442F4(AudioOwner* owner, AudioRecord* record) {
    AudioState* state = owner->state;

    state->first = record->first;
    state->second = record->second;
    func_80044270(state, record->third, record->fourth);
    state->third = record->fifth;
    func_8004256C(state->target, record->second, record->fifth,
                  record->value);
}
