#include "types.h"

extern s16 D_80086DA8;
extern s8 D_80086DE4;
extern u8 D_800880E8;
extern u16 D_8008B3B0[][3];

extern void func_80030EF4(s16 index, u8 *first, u8 *second);
extern u32 func_80030B54(s16 index);

u32 runtime_callback_configure(u32 *output)
{
    u32 result = 0;
    u32 output_value = 0;
    s32 i;

    if (output != 0) {
        i = 0;
        if (i < D_80086DA8) {
            do {
                u32 flags = D_8008B3B0[
                    *(s8 *)((u32)&D_80086DE4 + i)][0];
                if (*(u8 *)((u32)&D_800880E8 + i) != 0) {
                    u8 first;
                    u8 second;
                    func_80030EF4((s16)i, &first, &second);
                    if (first < 10) flags |= 0x200;
                    if (first >= 22) flags |= 0x100;
                    if (second < 10) flags |= 0x800;
                    if (second >= 22) flags |= 0x400;
                }
                output_value |= flags & 0xFF3F;
                i++;
            } while (i < D_80086DA8);
        }
        if (output_value & 0x800) output_value &= ~0x400;
        if (output_value & 0x200) output_value &= ~0x100;
        *output = output_value;
    }

    i = 0;
    if (i < D_80086DA8) {
        do {
            result |= func_80030B54((s16)i);
            i++;
        } while (i < D_80086DA8);
    }
    if (result & 0x800) result &= ~0x400;
    if (result & 0x200) result &= ~0x100;
    return result;
}
