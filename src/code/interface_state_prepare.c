#include "types.h"

typedef void (*InterfaceCallback)(void* owner, s32 mode);

typedef struct Interface {
    u8 pad0[0x24];
    InterfaceCallback callback;
} Interface;

typedef struct InterfaceOwner {
    u8 pad0[4];
    Interface* interface;
    u8 pad8[4];
    void* extended;
    s32 delay;
} InterfaceOwner;

void func_80063318(InterfaceOwner* owner) {
    s32 mode;

    for (mode = 1; mode > 0; mode--) {
        owner->interface->callback(owner, mode);
    }
    owner->delay = owner->extended != 0 ? 200 : 100;
}
