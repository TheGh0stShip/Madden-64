#include "types.h"

extern u32 D_8007A500;
extern u8 D_8008B07C[];
extern u8 D_8008B080[];
extern void func_80036540(s32 zero);

void audio_channel_wait_release(u32 channel, u32 index)
{
    register u32 channel_value __asm__("$3");
    register u32 triple __asm__("$2");
    register u32 offset __asm__("$6");
    u32 *resources;

check:
    if (D_8007A500 != 0) {
        goto done;
    }
    channel_value = channel & 0xFFFF;
    triple = channel_value * 3;
    offset = triple * 8;
    __asm__ volatile ("" : : "r" (channel_value), "r" (triple), "r" (offset));
    resources = *(u32 **)(D_8008B07C + offset);
    if (resources[index] == 0) {
        goto release;
    }
    if (((*(u8 **)(D_8008B080 + offset))[index] & 0x41) == 0) {
        goto done;
    }
    goto check;
release:
    func_80036540(0);
done:
    return;
}
