#include "types.h"

extern u8 D_8008B07C[];
extern void func_800369A0(u16 channel);
extern void func_8003663C(u16 channel, u32 index, u32 value);
extern void func_80036100(u16 channel, u32 index);

void audio_channel_configure(u16 channel, u32 index, u32 value, u32 parameter)
{
    func_800369A0(channel);
    *(u32 *)(*(u8 **)(D_8008B07C + channel * 24) + index * 4) = value;
    func_8003663C(channel, index, parameter);
    func_80036100(channel, index);
}
