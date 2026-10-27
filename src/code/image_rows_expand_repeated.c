#include "types.h"

extern void func_80063250(void **sources, s32 source_index,
                          void **destinations, s32 destination_index,
                          s32 count, u32 size);

void image_rows_expand_repeated(u8 *state, u8 *descriptor, u8 **sources,
                                u8 ***destination_tables)
{
    register u8 *saved_state __asm__("$17") = state;
    register u8 **source __asm__("$18");
    register u8 **destination __asm__("$19");
    register s32 group_size __asm__("$20");
    register u8 **destinations __asm__("$21");
    register s32 repeat_count __asm__("$22");
    register s32 copy_count __asm__("$23");
    register s32 index __asm__("$16");
    s32 single_group;
    u8 *info;
    volatile u64 padding;

    __asm__("" : : "r"(saved_state));
    info = *(u8 **)(saved_state + 0x1C0) + *(s32 *)(descriptor + 4);
    destinations = *destination_tables;
    repeat_count = info[0x8C];
    group_size = info[0x96];
    if (*(s32 *)(saved_state + 0x134) > 0) {
        index = 0;
        single_group = group_size < 2;
        __asm__("" : "=r"(single_group) : "0"(single_group));
        copy_count = group_size - 1;
        destination = destinations;
        source = sources;
        do {
            u8 *output = *destination;
            u8 *end = output + *(s32 *)(saved_state + 0x70);
            u8 *input = *source;

            while (output < end) {
                s32 remaining = repeat_count;
                u8 value = *input++;
                while (remaining > 0) {
                    *output++ = value;
                    remaining--;
                }
            }
            if (!single_group) {
                func_80063250((void **)destinations, index,
                              (void **)destinations, index + 1,
                              copy_count, *(u32 *)(saved_state + 0x70));
            }
            source++;
            index += group_size;
            destination += group_size;
        } while (index < *(s32 *)(saved_state + 0x134));
    }
}
