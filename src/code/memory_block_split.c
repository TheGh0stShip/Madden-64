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
extern MemoryBlock *func_80033558(s32 pool);
extern void func_80032F3C(s32 pool, u32 address);

void memory_block_split(s16 pool, u32 address, u32 size)
{
    MemoryBlock *block = D_8007A414[pool];
    MemoryBlock *new_block;

    if (block == (MemoryBlock *)-1) {
        goto found;
    }
    {
        MemoryBlock *sentinel = (MemoryBlock *)-1;

find:
        if (block->address >= address) {
            goto found;
        }
        block = block->next;
        if (block != sentinel) {
            goto find;
        }
    }
found:
    if (block->size != size) {
        new_block = func_80033558(pool);
        new_block->address = block->address + size;
        new_block->size = block->size - size;
        new_block->flags = block->flags;
        new_block->next = block->next;
        new_block->previous = block;
        block->size = size;
        block->next = new_block;
        if (new_block->next != (MemoryBlock *)-1) {
            new_block->next->previous = new_block;
        }
        func_80032F3C(pool, new_block->address);
    }
}
