#include "types.h"

typedef struct ObjectSampleOwner {
    u8 pad0[0xC];
    u8* sample;
} ObjectSampleOwner;

extern void func_800DB44C(u8* src, u32* first, u32* second, u32* third);

s32 func_800DF780(ObjectSampleOwner* owner) {
    u32 first;
    u32 second;

    func_800DB44C(owner->sample + 0x1C, &first, &second, &second);
    return ((s8*)&first)[3];
}
