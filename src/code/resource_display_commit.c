#include "types.h"

extern void func_80019868(void *stream, void *destination, u32 size, u32 mode);

void resource_display_commit(void *stream, u32 inner_count_arg,
                             u32 outer_count_arg, u32 *destination_offset,
                             u8 *destination)
{
    register u8 *saved_destination __asm__("$20") = destination;
    register void *saved_stream __asm__("$18");
    register u16 outer_index __asm__("$19");
    register u32 *saved_offset __asm__("$17") = destination_offset;
    register u32 outer_count __asm__("$22") = outer_count_arg;
    register u32 inner_count __asm__("$21");
    register u32 has_inner __asm__("$23");
    register u16 progress __asm__("$16");
    s8 values[3];

    saved_stream = stream;
    __asm__("" : "=r"(saved_stream) : "0"(saved_stream));
    outer_index = 0;

    if ((u16)outer_count != 0) {
        inner_count = inner_count_arg & 0xFFFF;
        has_inner = inner_count != 0;
        do {
            func_80019868(saved_stream, &values[0], 1, 2);
            progress = 0;
            if (has_inner) {
                do {
                    func_80019868(saved_stream, &values[1], 1, 2);
                    if (values[1] > 0) {
                        register s8 index __asm__("$4");

                        func_80019868(saved_stream, &values[2], 1, 2);
                        if (values[1] > 0) {
                            register s8 next_index __asm__("$2");

                            index = 0;
                            do {
                                saved_destination[*saved_offset] = values[2];
                                (*saved_offset)++;
                                next_index = index + 1;
                                index = next_index;
                                progress++;
                            } while (next_index < values[1]);
                        }
                    } else {
                        func_80019868(saved_stream,
                                      saved_destination + *saved_offset,
                                      (u16)-values[1], 2);
                        *saved_offset -= values[1];
                        progress -= (s8)(u8)values[1];
                    }
                } while ((u16)progress < (u16)inner_count);
            }
            __asm__("" : "=r"(outer_index) : "0"(outer_index));
            outer_index++;
        } while ((u16)outer_index < (u16)outer_count);
    }
}
