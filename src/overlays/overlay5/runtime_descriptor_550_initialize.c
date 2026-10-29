#include "types.h"

typedef struct RuntimeDescriptor {
    u8 pad00[0x18];
    s32 end;
    s32 current;
    s32 count;
} RuntimeDescriptor;

extern u8 D_800E7480[];

void func_800D5C1C(s32 start, RuntimeDescriptor *descriptor, void *table);

void overlay5_runtime_descriptor_550_initialize(RuntimeDescriptor *descriptor) {
    descriptor->end = 0x558;
    descriptor->current = 0;
    descriptor->count = 0x14A;
    func_800D5C1C(0x550, descriptor, D_800E7480);
}
