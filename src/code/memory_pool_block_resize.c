#include "types.h"

typedef struct MemoryBlock {
    u32 address;
    u32 size;
    u16 flags;
    u16 pad;
    struct MemoryBlock *next;
    struct MemoryBlock *previous;
} MemoryBlock;

extern MemoryBlock *D_8007A414[];
extern void func_80033768(MemoryBlock *block, s16 pool);
extern void func_800334E0(MemoryBlock *first, MemoryBlock *second, s16 pool);
extern void func_8003368C(MemoryBlock *block, s16 pool);

void memory_pool_block_resize(u32 pool, u32 address)
{
    register MemoryBlock *block __asm__("$17") = D_8007A414[(s16)pool];
    register MemoryBlock *neighbor __asm__("$18");
    register u32 saved_pool __asm__("$19") = pool;
    s32 pool_index;

    while (block != (MemoryBlock *)-1 && block->address < address) {
        block = block->next;
    }
    block->flags = 1;
    neighbor = block->previous;
    if (neighbor != (MemoryBlock *)-1 && (neighbor->flags & 1)) {
        pool_index = (s16)saved_pool;
        func_80033768(neighbor, pool_index);
        func_800334E0(neighbor, block, pool_index);
        block = neighbor;
    }
    neighbor = block->next;
    if (neighbor != (MemoryBlock *)-1 && (neighbor->flags & 1)) {
        pool_index = (s16)saved_pool;
        func_80033768(neighbor, pool_index);
        func_800334E0(block, neighbor, pool_index);
    }
    func_8003368C(block, (s16)saved_pool);
}
