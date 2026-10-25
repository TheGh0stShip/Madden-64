#include "types.h"

typedef void* (*AllocateFunction)(void* owner, s32 count, s32 size);

typedef struct AllocatorInterface {
    AllocateFunction allocate;
} AllocatorInterface;

typedef struct HandlerTable {
    void (*primary)(void);
    void (*secondary)(void);
    u8 pad8[0x20];
    u32 values28[4];
    u32 values38[4];
} HandlerTable;

typedef struct HandlerOwner {
    u8 pad0[4];
    AllocatorInterface* allocator;
    u8 pad8[0x1B0];
    HandlerTable* handlers;
} HandlerOwner;

extern void func_80058D78(void);
extern void func_800594D8(void);

void func_80059A00(HandlerOwner* owner) {
    HandlerTable* handlers;
    s32 index;

    handlers = owner->allocator->allocate(owner, 1, 0x48);
    owner->handlers = handlers;
    handlers->primary = func_80058D78;
    handlers->secondary = func_800594D8;
    for (index = 0; index < 4; index++) {
        handlers->values38[index] = 0;
        handlers->values28[index] = 0;
    }
}
