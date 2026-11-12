#include "types.h"

extern void func_80063250(void **sources, s32 source_index,
                          void **destinations, s32 destination_index,
                          s32 count, u32 size);

void image_rows_expand_horizontal(u8 *state, void *unused, u8 **sources,
                                  u8 ***destination_tables)
{
    register u8 *saved_state = state;
    register u8 **source;
    register u8 **destinations = *destination_tables;
    register u8 **destination;
    register s32 index;
    register s32 one;
    volatile u64 padding;
    (void)unused;
    if (*(s32 *)(saved_state + 0x134) > 0) {
      index = 0;
      one = 1;
      destination = destinations;
      source = sources;
      do {
        u8 *output = *destination;
        u8 *end = output + *(s32 *)(saved_state + 0x70);
        u8 *input = *source;

        while (output < end) {
            u8 value = *input++;
            *output++ = value;
            *output++ = value;
        }
        source++;
        func_80063250((void **)destinations, index,
                      (void **)destinations, index + 1,
                      one, *(u32 *)(saved_state + 0x70));
        index += 2;
        destination += 2;
      } while (index < *(s32 *)(saved_state + 0x134));
    }
}
