#include "types.h"

void tiled_columns_copy(u8 *object, u8 ***sources, s32 plane,
                        u8 **destinations, s32 plane_count)
{
    register s32 planes = plane_count;
    register s32 columns = *(s32 *)(object + 0x20);
    register s32 rows = *(s32 *)(object + 0x70);
    register s32 column;
    register u32 source_offset;
    register u8 ***source_pointer;
    register u8 *source;
    register s32 remaining;
    register u8 *destination;
    u8 value;
    volatile u64 unused;

    planes--;
    if (planes < 0) {
        return;
    }
    do {
        column = 0;
        if (columns > 0) {
            source_offset = plane << 2;
            source_pointer = sources;
            do {
                source = *(u8 **)((u8 *)source_offset +
                                  (u32)*source_pointer);
                remaining = rows;
                destination = *destinations + column;
                if (remaining != 0) {
                    do {
                        value = *source++;
                        remaining--;
                        *destination = value;
                        destination += columns;
                    } while (remaining != 0);
                }
                column++;
                source_pointer++;
            } while (column < columns);
        }
        plane++;
        planes--;
        destinations++;
    } while (planes >= 0);
}
