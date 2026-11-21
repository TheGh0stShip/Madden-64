#include "types.h"

extern void resource_bytes_copy(void *reader, void *destination, u16 count, u32 mode);

int abs(int);

void resource_display_process(void *reader, u16 width, s32 unused, s32 *pos, u8 *dest) {
    u16 lines;
    u16 op;
    u8 skip;
    s8 run;
    u8 first;
    u8 second;
    u16 line;
    u16 i;
    u16 j;
    u16 total;
    u16 count;

    resource_bytes_copy(reader, &lines, 2, 0);
    for (line = 0; line < lines;) {
        resource_bytes_copy(reader, &op, 2, 0);
        switch (op & 0xC000) {
        case 0x4000:
            break;
        case 0xC000:
            *pos += abs((s16)op) * width;
            break;
        case 0x8000:
            *(dest + *pos + width) = op;
            break;
        default:
            count = op;
            i = 0;
            total = 0;
            if (count != 0) {
                for (; line < lines && i < count; i++) {
                    resource_bytes_copy(reader, &skip, 1, 2);
                    *pos += skip;
                    total += skip;
                    resource_bytes_copy(reader, &run, 1, 2);
                    if (run > 0) {
                        resource_bytes_copy(reader, dest + *pos, run * 2, 2);
                        *pos += run * 2;
                        total += run * 2;
                    } else {
                        resource_bytes_copy(reader, &first, 1, 2);
                        resource_bytes_copy(reader, &second, 1, 2);
                        for (j = 0; j < abs(run); j++) {
                            dest[*pos] = first;
                            (*pos)++;
                            dest[*pos] = second;
                            (*pos)++;
                            total += 2;
                        }
                    }
                }
                line++;
                *pos += width - total;
            } else {
                line++;
            }
            break;
        }
    }
}
