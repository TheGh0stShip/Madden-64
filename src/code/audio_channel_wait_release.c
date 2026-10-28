#include "types.h"

extern u32 D_8007A500;
extern u8 D_8008B07C[];
extern u8 D_8008B080[];
extern void func_80036540(s32 zero);

void audio_channel_wait_release(u32 channel, u32 index)
{
    u32 channel_value;
    u32 triple;
    u32 offset;
    u32 *resources;

check:
    if (D_8007A500 != 0) {
        goto done;
    }
    channel_value = channel & 0xFFFF;
    triple = channel_value * 3;
    offset = triple * 8;
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
