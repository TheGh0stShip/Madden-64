#include "types.h"

extern u16 D_80082D84;
extern u16 D_80084ED0;
extern void func_80040010(void);

void audio_slot_markers_reset(void)
{
    s16 index;
    s32 missing;
    s32 marker;

    func_80040010();
    index = 0;
    missing = 0xFFFF;
    marker = 0x20;
    do {
        s32 offset = index * 4;

        if (*(u16 *)((u32)&D_80082D84 + offset) != missing &&
            (*(u8 *)((u32)&D_80082D84 + offset + 3) & 0xE0) == marker) {
            *(u16 *)((u32)&D_80082D84 + offset) = missing;
        }
        offset = index * 4;
        if (*(u16 *)((u32)&D_80084ED0 + offset) != missing &&
            (*(u8 *)((u32)&D_80084ED0 + offset + 3) & 0xE0) == marker) {
            *(u16 *)((u32)&D_80084ED0 + offset) = missing;
        }
        index++;
    } while (index < 4);
}
