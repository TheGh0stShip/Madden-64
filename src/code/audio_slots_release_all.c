#include "types.h"

extern u16 D_80082D84;
extern u16 D_80084ED0;
extern void func_8003F28C(void);
extern void func_800400F4(void *slot);

void audio_slots_release_all(void)
{
    s16 index;
    register s32 missing __asm__("$18");
    register u8 *primary __asm__("$19");
    register u8 *secondary __asm__("$20");

    func_8003F28C();
    index = 0;
    missing = 0xFFFF;
    primary = (u8 *)&D_80082D84;
    secondary = primary + 0x214C;
    do {
        register s32 shifted __asm__("$2") = index << 16;
        register s32 offset __asm__("$16") = shifted >> 14;

        if (*(u16 *)((u32)&D_80082D84 + offset) != missing) {
            func_800400F4((void *)(offset + (u32)primary));
        }
        if (*(u16 *)((u32)&D_80084ED0 + offset) != missing) {
            func_800400F4((void *)(offset + (u32)secondary));
        }
        index++;
    } while (index < 4);
}
