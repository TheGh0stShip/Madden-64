#include "types.h"

typedef struct MemoryListBlock {
    u32 unused;
    u32 key;
    u8 pad[12];
    struct MemoryListBlock *next;
    struct MemoryListBlock *previous;
} MemoryListBlock;

extern MemoryListBlock *D_8007A40C[];
extern MemoryListBlock *D_8007A410[];

void memory_block_insert(MemoryListBlock *block, s16 pool)
{
    register MemoryListBlock *saved_block __asm__("$4") = block;
    register u32 key __asm__("$6");
    register MemoryListBlock *current __asm__("$3") = D_8007A40C[pool];
    register MemoryListBlock *previous __asm__("$2");

    if (current != (MemoryListBlock *)-1) goto search_setup;
    D_8007A410[pool] = saved_block;
    D_8007A40C[pool] = saved_block;
    saved_block->previous = current;
    saved_block->next = current;
    goto done;

search_setup:
    {
        MemoryListBlock *sentinel;
        sentinel = (MemoryListBlock *)-1;
        key = saved_block->key;
        __asm__("" : "=r"(key) : "0"(key));
search:
        if (current->key >= key) {
            key = (u32)-1;
            goto after_search;
        }
        current = current->next;
        if (current != sentinel) goto search;
        key = (u32)-1;
after_search:
        if (current != (MemoryListBlock *)key) goto middle;
        current = D_8007A410[pool];
        current->next = saved_block;
        saved_block->previous = current;
        saved_block->next = (MemoryListBlock *)key;
        D_8007A410[pool] = saved_block;
        goto done;
middle:
        previous = current->previous;
        if (previous != (MemoryListBlock *)key) goto normal;
        current->previous = saved_block;
        saved_block->previous = previous;
        saved_block->next = current;
        D_8007A40C[pool] = saved_block;
        goto done;
normal:
        previous->next = saved_block;
        saved_block->previous = previous;
        saved_block->next = current;
        current->previous = saved_block;
    }
done:
    return;
}
