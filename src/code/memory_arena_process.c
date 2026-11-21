#include "types.h"

typedef struct MemoryBlock {
    u32 address;
    u32 size;
    u16 flags;
    u16 pad;
    struct MemoryBlock *next;
    struct MemoryBlock *previous;
    struct MemoryBlock *free_next;
} MemoryBlock;

extern u16 D_8007A3FC[];
extern MemoryBlock *D_8007A40C[];
extern MemoryBlock *D_8007A414[];
extern MemoryBlock *func_80033558(s32 pool);
extern void func_8003368C(MemoryBlock *block, s16 pool);
extern void func_80033768(MemoryBlock *block, s16 pool);

u32 memory_arena_process(s16 pool, u32 size, u32 align)
{
    MemoryBlock *block;
    MemoryBlock *new_block;
    u32 alignment = D_8007A3FC[pool];
    u32 padding;
    u32 aligned;

    block = D_8007A40C[pool];
    size--;
    aligned = size + alignment;
    aligned &= -alignment;
    while (block != (MemoryBlock *)-1) {
        if ((block->flags & 1) && block->size >= aligned) {
            padding = block->address & (align - 1);
            if (padding != 0) {
                padding = align - padding;
                if (block->size - padding < aligned) {
                    goto next;
                }
                new_block = func_80033558(pool);
                new_block->address = block->address;
                new_block->size = padding;
                new_block->flags = block->flags;
                new_block->previous = block->previous;
                new_block->next = block;
                block->size -= padding;
                block->address += padding;
                block->previous = new_block;
                if (block->previous->previous == (MemoryBlock *)-1) { D_8007A414[pool] = new_block; }
                if (new_block->previous != (MemoryBlock *)-1) { new_block->previous->next = new_block; }
                func_8003368C(new_block, pool);
            }
            if (aligned < block->size) {
                new_block = func_80033558(pool);
                new_block->address = block->address + aligned;
                new_block->size = block->size - aligned;
                new_block->flags = block->flags;
                new_block->next = block->next;
                new_block->previous = block;
                block->size = aligned;
                block->next = new_block;
                if (new_block->next != (MemoryBlock *)-1) {
                    new_block->next->previous = new_block;
                }
                func_8003368C(new_block, pool);
            }
            func_80033768(block, pool);
            block->flags = 0xFFFE;
            return block->address;
        }
    next:
        block = block->free_next;
    }
    return 0;
}
