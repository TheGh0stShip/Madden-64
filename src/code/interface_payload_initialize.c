#include "types.h"

typedef void* (*AllocateCallback)(void* interface, s32 count, s32 size);

typedef struct Allocator {
    AllocateCallback allocate;
} Allocator;

typedef struct InterfacePayload {
    void* first;
    void* second;
    s32 state;
    u8 padC[0x10];
} InterfacePayload;

typedef struct InterfaceOwner {
    u8 pad0[4];
    Allocator* allocator;
    u8 pad8[0x198];
    InterfacePayload* payload;
} InterfaceOwner;

extern void func_80055BBC(InterfaceOwner* owner);
extern void func_80055E8C(void);
extern void func_80056090(void);

void func_8005619C(InterfaceOwner* owner) {
    InterfacePayload* payload = owner->allocator->allocate(owner, 1, 28);

    owner->payload = payload;
    payload->first = func_80055E8C;
    payload->second = func_80056090;
    payload->state = 0;
    func_80055BBC(owner);
}
