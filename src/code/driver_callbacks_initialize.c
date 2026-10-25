#include "types.h"

typedef void *(*AllocateCallback)(void *context, s32 zero, s32 size);

typedef struct DriverAllocator {
    AllocateCallback allocate;
} DriverAllocator;

typedef struct DriverCallbacks {
    void *field0;
    void *field4;
    void *callback8;
    void *callbackC;
    void *callback10;
    void *callback14;
    void *callback18;
    void *owner;
} DriverCallbacks;

typedef struct DriverContext {
    u32 field0;
    DriverAllocator *allocator;
    u8 pad8[12];
    DriverCallbacks *callbacks;
} DriverContext;

extern void func_80055558(void);
extern void func_80055568(void);
extern void func_80055588(void);
extern void func_80058B08(void);
extern void func_80055604(void);

void driver_callbacks_initialize(DriverContext *context, void *owner)
{
    register DriverCallbacks *callbacks __asm__("$4");

    if (context->callbacks == 0) {
        DriverCallbacks *allocated = context->allocator->allocate(context, 0, 0x24);

        context->callbacks = allocated;
        allocated->owner = owner;
    }
    callbacks = context->callbacks;
    callbacks->callback8 = func_80055558;
    callbacks->callbackC = func_80055568;
    callbacks->callback10 = func_80055588;
    callbacks->callback14 = func_80058B08;
    callbacks->callback18 = func_80055604;
    callbacks->field4 = 0;
    callbacks->field0 = 0;
}
