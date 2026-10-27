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
extern MemoryBlock *func_80033558(s32 pool);
extern void func_8003368C(MemoryBlock *block, s32 pool);
extern void func_80033768(MemoryBlock *block, s32 pool);

u32 memory_pool_range_take(s32 pool, u32 size)
{
    register MemoryBlock *block __asm__("$16");
    register u32 aligned_size __asm__("$17");
    register s32 pool_index __asm__("$18");
    register u32 saved_shift __asm__("$20");
    register MemoryBlock *sentinel __asm__("$19");
    register u16 used_flags __asm__("$21");
    register u32 shifted_pool __asm__("$6") = pool << 16;
    register s32 signed_pool __asm__("$4");
    register u32 alignment __asm__("$3");

    signed_pool = (s32)shifted_pool >> 16;
    alignment = D_8007A3FC[signed_pool];
    block = D_8007A40C[signed_pool];
    size--;
    aligned_size = size + alignment;
    __asm__("" : "=r"(aligned_size) : "0"(aligned_size));
    aligned_size &= -alignment;
    if (block != (MemoryBlock *)-1) {
      saved_shift = shifted_pool;
      __asm__("" : "=r"(saved_shift) : "0"(saved_shift));
      pool_index = signed_pool;
      sentinel = (MemoryBlock *)-1;
      used_flags = 0xFFFE;
      do {
        if ((block->flags & 1) && block->size >= aligned_size) {
            if (aligned_size < block->size) {
                MemoryBlock *new_block = func_80033558(pool_index);
                new_block->address = block->address + aligned_size;
                new_block->size = block->size - aligned_size;
                new_block->flags = block->flags;
                new_block->next = block->next;
                new_block->previous = block;
                block->size = aligned_size;
                block->next = new_block;
                if (new_block->next != sentinel) {
                    new_block->next->previous = new_block;
                }
                func_8003368C(new_block, pool_index);
            }
            func_80033768(block, (s32)saved_shift >> 16);
            block->flags = used_flags;
            return block->address;
        }
        block = block->free_next;
      } while (block != sentinel);
    }
    return 0;
}
