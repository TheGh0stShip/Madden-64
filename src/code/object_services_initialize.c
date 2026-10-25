#include "types.h"

typedef void *(*ObjectAllocate)(void *owner, s32 zero, s32 size);

typedef struct ObjectAllocator {
    ObjectAllocate allocate;
} ObjectAllocator;

typedef struct ObjectContext {
    u32 field0;
    ObjectAllocator *allocator;
    u8 pad8[0x1AC];
    u32 *services;
} ObjectContext;

extern void func_80058C88(ObjectContext *owner);
extern void func_8005872C(void);
extern void func_80058A48(void);
extern void func_80058384(void);
extern void func_80057344(void);
extern void func_8005767C(void);

void object_services_initialize(ObjectContext *owner)
{
    s32 index;
    u32 *services = owner->allocator->allocate(owner, 0, 0x60);

    owner->services = services;
    services[0] = (u32)func_80058C88;
    owner->services[1] = (u32)func_8005872C;
    owner->services[2] = (u32)func_80058A48;
    owner->services[3] = (u32)func_80058384;
    for (index = 0; index < 16; index++) {
        owner->services[index + 4] = (u32)func_80058384;
    }
    owner->services[4] = (u32)func_80057344;
    owner->services[18] = (u32)func_8005767C;
    func_80058C88(owner);
}
