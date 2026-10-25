#include "types.h"

extern s32 decode_lz_type_1(u8 *src, u8 *dst);
extern void boot_cache_invalidate(void);
extern void boot_cache_writeback_invalidate(void *address, s32 size);
extern s32 boot_copy_source[];
extern u32 packed_program[];

void boot_load_program(void)
{
    s32 *source;
    s32 *destination;
    s32 index;
    s32 previous;
    u32 entry;
    register volatile u32 *pi_dram_address __asm__("$3");
    register volatile u32 *pi_cart_address __asm__("$5");
    register volatile u32 *pi_status __asm__("$6");
    register u32 packed_address __asm__("$4");
    u32 packed_offset;

    pi_dram_address = (volatile u32 *)0xa4500010;
    pi_cart_address = (volatile u32 *)0xa4500014;
    pi_status = (volatile u32 *)0xa4500008;
    entry = 0x80000400;
    packed_address = (u32)packed_program;
    *pi_dram_address = 0x8ff;
    *pi_cart_address = 0x0f;
    *pi_status = 1;

    packed_offset = *(u32 *)packed_address;
    decode_lz_type_1((u8 *)(packed_address + packed_offset), (u8 *)0x80000400);

    index = 0x0f;
    destination = (s32 *)0x8000043c;
    source = boot_copy_source;
    do {
        *destination = *source;
        source--;
        previous = index;
        index--;
        destination--;
    } while (previous != 0);

    entry += 0x47;
    entry &= ~7;
    boot_cache_invalidate();
    boot_cache_writeback_invalidate((void *)0x80000400, 0x100000);
    ((void (*)(void))entry)();
}
