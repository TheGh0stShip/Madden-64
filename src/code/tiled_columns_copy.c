#include "types.h"

void tiled_columns_copy(u8 *object, u8 ***sources, s32 plane,
                        u8 **destinations, s32 plane_count)
{
    register s32 planes __asm__("$12") = plane_count - 1;
    register s32 columns __asm__("$11") = *(s32 *)(object + 0x20);
    register s32 rows __asm__("$14") = *(s32 *)(object + 0x70);
    register s32 column __asm__("$9");
    register u32 source_offset __asm__("$13");
    register u8 ***source_pointer __asm__("$10");
    register u8 *source __asm__("$8");
    register s32 remaining __asm__("$4");
    register u8 *destination __asm__("$3");
    u8 value;
    volatile u64 unused;

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
