#include "types.h"

extern void* func_8004DF68(void* destination, const void* source, u32 size);

void func_80063250(void** sources, s32 source_index, void** destinations,
                   s32 destination_index, s32 count, u32 size) {
    sources += source_index;
    destinations += destination_index;

    while (count > 0) {
        void* source_block = *sources++;
        void* destination_block = *destinations++;
        count--;
        func_8004DF68(destination_block, source_block, size);
    }
}
