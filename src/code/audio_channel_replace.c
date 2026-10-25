#include "types.h"

extern u32 D_8008B080[];
extern void func_80036540(s32 value);
extern void func_80036A24(u16 channel, u8 mode);

void audio_channel_replace(u16 channel, s32 mode, u32 replacement)
{
    register u32 index __asm__("$18") = channel & 0xBFFF;
    register u32 scaled __asm__("$2") = index * 3;
    register u32 offset __asm__("$17") = scaled << 3;
    register s32 saved_mode __asm__("$16") = mode;
    register u32 saved_replacement __asm__("$19") = replacement;

    if (*(u32 *)((u32)D_8008B080 + offset) != 0) {
        func_80036540(0);
    }
    *(u32 *)((u32)D_8008B080 + offset) = saved_replacement;
    func_80036A24(index | 0x4000, saved_mode & 0x3F);
}
