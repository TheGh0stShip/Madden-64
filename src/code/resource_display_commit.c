#include "types.h"

void resource_bytes_copy(void *stream, void *destination, u16 size, s32 mode);

void resource_display_commit(void *stream, u16 width, u16 height, s32 *offset, u8 *destination) {
    s8 header;
    s8 count;
    u8 value;
    u16 y;
    u16 x;
    s8 i;

    for (y = 0; y < height; y++) {
        resource_bytes_copy(stream, &header, 1, 2);
        for (x = 0; x < width;) {
            resource_bytes_copy(stream, &count, 1, 2);
            if (count > 0) {
                resource_bytes_copy(stream, &value, 1, 2);
                for (i = 0; i < count; i++) {
                    destination[*offset] = value;
                    (*offset)++;
                    x++;
                }
            } else {
                resource_bytes_copy(stream, destination + *offset, -count, 2);
                *offset -= count;
                x -= count;
            }
        }
    }
}
