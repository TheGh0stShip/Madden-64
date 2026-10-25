#include "types.h"

extern void* func_8004DF68(void* destination, const void* source, u32 size);

void func_80063250(void** sources, s32 source_index, void** destinations,
                   s32 destination_index, s32 count, u32 size) {
    register void** source __asm__("$17") = sources + source_index;
    register void** destination __asm__("$16") = destinations + destination_index;
    register s32 remaining __asm__("$18") = count;
    register u32 block_size __asm__("$19") = size;

    while (remaining > 0) {
        void* source_block = *source++;
        void* destination_block = *destination++;
        remaining--;
        func_8004DF68(destination_block, source_block, block_size);
    }
}
