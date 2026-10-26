#include "types.h"

typedef struct ObjectIndexFlags {
    u8 pad00[4];
    u16 flags;
} ObjectIndexFlags;

typedef struct ObjectIndexData {
    u8 pad00[4];
    ObjectIndexFlags *metadata;
    u8 pad08[4];
    u16 *indices;
} ObjectIndexData;

typedef struct ObjectIndexContext {
    u8 pad00[8];
    ObjectIndexData *data;
} ObjectIndexContext;

void object_index_rows_shift(ObjectIndexContext *context, u8 start, u8 end,
                             u8 rows)
{
    ObjectIndexData *data = context->data;
    u16 *indices;
    u8 row;

    if ((data->metadata->flags & 8) == 0) {
        return;
    }
    indices = data->indices;
    row = 0;
    if (rows == 0) {
        return;
    }
    do {
        u16 saved = indices[start];
        u8 index = start;
        if (start < end) {
            do {
                indices[index] = indices[index + 1];
                index++;
            } while (index < end);
        }
        row++;
        indices[end] = saved;
    } while (row < rows);
}
