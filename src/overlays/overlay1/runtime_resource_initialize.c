#include "types.h"

typedef struct RuntimeDescriptor {
    u16 size;
    u8 pad02[2];
    void *data;
    u32 value08;
    u8 pad0C[4];
    u16 type;
    u8 pad12[6];
} RuntimeDescriptor;

typedef struct RuntimeResource {
    u8 pad00[0x1C];
    s32 value1C;
    s32 value20;
} RuntimeResource;

extern u8 *D_8006EA74;
extern RuntimeResource *D_8006EA78;
extern void *D_80087A64;
extern void *D_80086C74;
extern void *func_8001AEA8(void *data);
extern RuntimeResource *func_8000D740(void *pool, s32 type, RuntimeDescriptor *descriptor);
extern void func_80041BB4(s32 type);
extern void func_8003E460(void);

void runtime_resource_initialize(void)
{
    RuntimeDescriptor descriptor;
    RuntimeResource *resource;

    D_80086C74 = func_8001AEA8(D_8006EA74 + 0x44C);
    descriptor.size = 0x100;
    descriptor.data = D_8006EA74 + 0x418;
    descriptor.value08 = 0;
    descriptor.type = 4;
    resource = func_8000D740(D_80087A64, 1, &descriptor);
    D_8006EA78 = resource;
    resource->value1C = 0;
    resource->value20 = 0;
    func_80041BB4(0xE);
    func_8003E460();
}
