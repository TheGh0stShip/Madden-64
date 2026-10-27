#include "types.h"

typedef struct MemoryPoolRegion {
    u32 base;
    u32 end;
    u16 block_count;
    u16 alignment;
} MemoryPoolRegion;

extern u16 D_8007A3F0[];
extern u16 D_8007A3FC[];
extern u32 D_8007A3F4[];
extern u32 D_8007A3F8[];
extern void *D_8007A400[];
extern u16 *D_8007A404[];
extern u32 memory_pool_range_take(s32 pool, u32 size);
extern void memory_pool_initialize(s32 pool);

void memory_pool_region_configure(s32 pool, MemoryPoolRegion *region)
{
    register MemoryPoolRegion *saved_region __asm__("$18") = region;
    register s32 pool_index __asm__("$17") = (s16)pool;
    register u32 raw_pool __asm__("$20") = pool;
    register u32 index_bytes __asm__("$19");
    register u32 *pool_base_slot __asm__("$16");
    register u32 block_bytes __asm__("$7");
    register u32 base __asm__("$5");
    register u32 mask __asm__("$6");
    register u32 count __asm__("$3");
    register u32 twice __asm__("$4");
    register u32 alignment_minus_one __asm__("$7");
    register u32 block_temp __asm__("$2");
    u32 allocation;
    register u32 alignment __asm__("$3");

    __asm__("" : "=r"(saved_region) : "0"(saved_region));
    D_8007A3F0[pool_index] = saved_region->block_count;
    alignment = saved_region->alignment;
    D_8007A3FC[pool_index] = alignment;
    __asm__("" : "=r"(raw_pool) : "0"(raw_pool));
    base = saved_region->base;
    alignment_minus_one = alignment - 1;
    count = saved_region->block_count;
    __asm__("" : "=r"(count) : "0"(count));
    mask = ~alignment_minus_one;
    base += alignment_minus_one;
    block_temp = count * 28;
    __asm__("" : "=r"(block_temp) : "0"(block_temp));
    block_bytes = block_temp;
    base &= mask;
    __asm__("" : "=r"(base) : "0"(base));
    twice = count * 2;
    __asm__("" : "=r"(twice) : "0"(twice));
    index_bytes = twice;
    saved_region->base = base;
    if (pool_index == 0) {
        D_8007A3F4[0] = saved_region->base + block_bytes + index_bytes;
        D_8007A3F8[0] = saved_region->end - D_8007A3F4[0];
        D_8007A400[0] = (void *)(saved_region->base + index_bytes);
        D_8007A404[0] = (u16 *)saved_region->base;
    } else {
        pool_base_slot = &D_8007A3F4[pool_index];
        *pool_base_slot = saved_region->base;
        allocation = memory_pool_range_take(0, block_bytes + index_bytes);
        D_8007A400[pool_index] = (void *)(allocation + index_bytes);
        D_8007A404[pool_index] = (u16 *)allocation;
        D_8007A3F8[pool_index] = saved_region->end - *pool_base_slot;
    }
    memory_pool_initialize((s16)raw_pool);
}
