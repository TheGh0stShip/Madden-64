#include "types.h"

extern s32 D_80085028;
extern s16 D_80085D42;
extern u8 D_80087B10[0x42];
extern u8 D_80087B08[8];
extern u8 D_80087B70[0x420];
extern u8 D_8008B790[8];
extern void *D_8007A538;
extern s16 D_80087AAE;
extern s32 D_800734F8;
extern s8 D_800734FC;
extern void *D_8008B348;
extern void *D_8008B34C;
extern s16 D_8007A53C;
extern s16 D_8007A540;
extern s16 D_8007A544;
extern s32 D_80087B00;
extern void *D_80088620;
extern void *D_8008B378;

extern s16 func_800356C4(void *first, u32 second);
extern void func_800049F0(s32 value);
extern void func_80033308(s32 unused, void *destination, u32 size, s32 value);
extern void *func_8002FEA4(void *callback, s32 value, s32 unused);
extern void func_8003CB2C(s8 value);
extern void *func_800337CC(s32 unused, u32 size, u32 alignment);
extern void func_8003CBD8(void);

void func_8003C8E0(void *first, u32 second, u32 unused, s32 mode)
{
    register s32 fill __asm__("$4");
    register s32 count __asm__("$3");
    register u8 *cursor __asm__("$2");
    register void **buffer_slot __asm__("$16");
    void *buffer;
    void *buffer_base;
    void *shared;
    register s32 clear_a0 __asm__("$4");
    register void *clear_a1 __asm__("$5");
    register u32 clear_a2 __asm__("$6");
    register s32 clear_a3 __asm__("$7");

    D_80085028 = mode;
    D_80085D42 = func_800356C4(first, second);
    if (mode == 1) {
        func_800049F0(0x5622);
        func_80033308(0, D_80087B70, 0x420, 0);
    }

    fill = -1;
    count = 0x41;
    cursor = &D_80087B10[0x41];
    do {
        *cursor = fill;
        count--;
        cursor--;
    } while (count >= 0);
    func_80033308(0, D_80087B08, 8, 0xFF);
    func_80033308(0, D_8008B790, 8, 0);
    D_8007A538 = func_8002FEA4(func_8003CBD8, 5, 0);
    D_80087AAE = -1;
    D_800734F8 = -1;
    func_8003CB2C(D_800734FC);
    buffer = func_800337CC(0, 0x2000, 0x10);
    clear_a0 = 0;
    clear_a1 = buffer;
    clear_a2 = 0x2000;
    clear_a3 = 0;
    buffer_slot = &D_8008B348;
    __asm__("" : "=r"(buffer_slot) : "0"(buffer_slot));
    __asm__("" : : "r"(clear_a0), "r"(clear_a1), "r"(clear_a2),
            "r"(clear_a3));
    *buffer_slot = clear_a1;
    func_80033308(clear_a0, clear_a1, clear_a2, clear_a3);
    buffer_base = *buffer_slot;
    shared = D_80088620;
    D_8007A544 = 0;
    D_8007A540 = 0;
    D_8007A53C = 0;
    D_80087B00 = 0;
    D_8008B34C = (u8 *)buffer_base + 0x1000;
    D_8008B378 = shared;
}
