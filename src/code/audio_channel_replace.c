#include "types.h"

extern u32 D_8008B080[];
extern void func_80036540(s32 value);
extern void func_80036A24(u16 channel, u8 mode);

void audio_channel_replace(u16 channel, s32 mode, u32 replacement)
{
    u32 index = channel & 0xBFFF;
    u32 scaled = index * 3;
    u32 offset = scaled << 3;
    s32 saved_mode;
    u32 saved_replacement;
    u32 previous;

    previous = *(u32 *)((u32)D_8008B080 + offset);
    saved_mode = mode;
    saved_replacement = replacement;
    do {
        if (previous != 0) {
            func_80036540(0);
        }
        *(u32 *)((u32)D_8008B080 + offset) = saved_replacement;
        break;
    } while (1);
    do {
        do {
            mode = saved_mode & 0x3F;
            break;
        } while (1);
        break;
    } while (1);
    func_80036A24(index | 0x4000, mode);
}
