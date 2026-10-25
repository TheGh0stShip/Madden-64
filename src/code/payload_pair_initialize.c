#include "types.h"

typedef struct Payload {
    u32 first;
    u32 second;
    u32 third;
} Payload;

typedef struct PayloadState {
    Payload* payload;
    u8 pad4[4];
    u32 value;
} PayloadState;

typedef struct PayloadOwner {
    u8 pad0[0xC];
    PayloadState* state;
    u8 pad10[2];
    u16 count;
} PayloadOwner;

extern void func_8001A224(PayloadOwner* owner);

void func_8001A424(u32 first, u32 second, PayloadOwner* owner) {
    owner->state->value = 0;
    owner->state->payload->first = first;
    owner->state->payload->second = second;
    owner->state->payload->third = 0;
    func_8001A224(owner);
    owner->count++;
}
