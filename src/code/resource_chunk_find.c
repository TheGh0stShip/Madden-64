#include "types.h"

extern s32 func_8002E108(const void *left, const void *right, u32 size);

void *resource_chunk_find(u8 *resource, const void *key)
{
    u8 *cursor = resource + 0x0C;
    u32 size = *(u32 *)(resource + 4) - 0x0C;
    u8 *end = resource + size;
    u8 *result = 0;

    while (result == 0 && cursor < end) {
        if (func_8002E108(cursor, key, 4) == 0) {
            result = cursor;
        } else {
            cursor += *(u32 *)(cursor + 4);
        }
    }
    return result;
}
