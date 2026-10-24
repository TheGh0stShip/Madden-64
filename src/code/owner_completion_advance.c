#include "types.h"

typedef void (*CompletionCallback)(void);

typedef struct CompletionInterface {
    u8 pad0[8];
    CompletionCallback callback;
} CompletionInterface;

typedef struct CompletionOwner {
    u8 pad0[0x54];
    void* active;
    u8 pad58[0x148];
    s32* counter;
    u8 pad1A4[0x24];
    CompletionInterface* interface;
} CompletionOwner;

void func_80056090(CompletionOwner* owner) {
    s32* counter = owner->counter;

    if (owner->active != 0) {
        owner->interface->callback();
    }
    counter[3]++;
}
