#include "types.h"

typedef void (*DurationMethod)(void);
extern void func_800548B8(void *owner);

void object_duration_apply(u8 *owner, s32 duration)
{
    if (*(s32 *)(owner + 0x10) != 0xCF && *(s32 *)(owner + 0x10) != 0xCC) {
        u32 *methods = *(u32 **)owner;

        methods[5] = 0x12;
        (*(u32 **)owner)[6] = *(s32 *)(owner + 0x10);
        ((DurationMethod)(*(u32 **)owner)[0])();
    }
    if (duration <= 0) {
        duration = 1;
    }
    if (*(u32 *)(*(u8 **)(owner + 0x1B0) + 0x14) == 0) {
        *(s32 *)(owner + 0x98) = duration;
    } else {
        s32 maximum = *(s32 *)(owner + 0x90);

        if (duration > maximum) {
            duration = maximum;
        }
        *(s32 *)(owner + 0x98) = duration;
    }
    func_800548B8(owner);
}
