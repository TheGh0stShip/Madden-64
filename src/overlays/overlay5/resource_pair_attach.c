#include "types.h"

typedef struct ResourcePairOutput {
    u8 pad0[0x20];
    s32 value;
} ResourcePairOutput;

extern void func_8001ECAC(void* owner, void* resource, s32 mode);
extern void func_8001EC20(void* owner, void* resource);

#ifndef BASE_VALUE
#define BASE_VALUE 49
#endif

void func_800D9764(void* owner, ResourcePairOutput* output, s32 index,
                   void* optional, void* required) {
    output->value = index * 13 + BASE_VALUE;
    if (optional != 0) {
        func_8001ECAC(owner, optional, 0);
        func_8001EC20(owner, optional);
    }
    func_8001ECAC(owner, required, 6);
    func_8001EC20(owner, required);
}
