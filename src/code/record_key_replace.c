#include "types.h"

extern s32 func_8002E148(const void *left, const void *right, u32 size);

typedef struct KeyPair {
    u32 first;
    u32 second;
} KeyPair;

void record_key_replace(u8 *records, const void *key, const u32 *replacement)
{
    register KeyPair *cursor = *(KeyPair **)(records + 8);
    register KeyPair *end = *(KeyPair **)(records + 0x0C);

    if (cursor < end) {
        do {
            if (func_8002E148(cursor, key, 8) == 0) {
                *cursor = *(const KeyPair *)replacement;
            }
            cursor++;
        } while (cursor < end);
    }
}
