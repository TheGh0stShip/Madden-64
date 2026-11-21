#include "types.h"

typedef struct {
    u16 width;
    u16 rows;
    u8 runs;
    u8 skip;
    s8 count;
    u8 value;
} RleHeader;

int abs(int);
void resource_bytes_copy(void *reader, void *destination, u32 count, u32 mode);

void resource_display_update(void *reader, u16 width, s32 unused, s32 *pos, u8 *dst) {
    RleHeader h;
    u16 row;
    u16 run;
    u16 k;
    u16 col;

    resource_bytes_copy(reader, &h.width, 2, 0);
    *pos = h.width * width;
    resource_bytes_copy(reader, &h.rows, 2, 0);
    for (row = 0, col = 0; row < h.rows; row++) {
        resource_bytes_copy(reader, &h.runs, 1, 2);
        for (run = 0; run < h.runs; run++) {
            resource_bytes_copy(reader, &h.skip, 1, 2);
            *pos += h.skip;
            col += h.skip;
            resource_bytes_copy(reader, &h.count, 1, 2);
            if (h.count > 0) {
                resource_bytes_copy(reader, dst + *pos, (u16)h.count, 2);
                *pos += h.count;
                col += h.count;
            } else {
                resource_bytes_copy(reader, &h.value, 1, 2);
                for (k = 0; k < abs(h.count); k++) {
                    dst[*pos] = h.value;
                    (*pos)++;
                    col++;
                }
            }
        }
        *pos += width - col;
        col = 0;
    }
}
