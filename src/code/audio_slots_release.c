#include "types.h"

extern u16 D_80082D84;
extern u16 D_80084ED0;
extern void func_8003F230(void *slot);

void audio_slots_release(void)
{
    s16 index = 0;
    s32 missing = 0xFFFF;
    s32 marker = 0xE0;
    register u8 *primary __asm__("$19") = (u8 *)&D_80082D84;
    register u8 *secondary __asm__("$20") = primary + 0x214C;

    do {
        s32 offset = index * 4;

        if (*(u16 *)((u32)&D_80082D84 + offset) != missing) {
            if (*(u8 *)((u32)&D_80082D84 + offset + 3) == marker) {
                func_8003F230((void *)(offset + (u32)primary));
            }
        }
        offset = index * 4;
        if (*(u16 *)((u32)&D_80084ED0 + offset) != missing) {
            if (*(u8 *)((u32)&D_80084ED0 + offset + 3) == marker) {
                func_8003F230((void *)(offset + (u32)secondary));
            }
        }
        index++;
    } while (index < 4);
}
