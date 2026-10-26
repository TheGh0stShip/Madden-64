#include "types.h"

#define WORD_BACK() do { source -= 4; value = *(u32 *)source; destination -= 4; *(u32 *)destination = value; } while (0)
#define BYTE_BACK() do { source--; value = *source; destination--; *destination = value; } while (0)
#define WORDS8_BACK() do { \
    source -= 4; value = *(u32 *)source; destination -= 4; \
    source -= 4; *(u32 *)destination = value; value = *(u32 *)source; destination -= 4; \
    source -= 4; *(u32 *)destination = value; value = *(u32 *)source; destination -= 4; \
    source -= 4; *(u32 *)destination = value; value = *(u32 *)source; destination -= 4; \
    source -= 4; *(u32 *)destination = value; value = *(u32 *)source; destination -= 4; \
    source -= 4; *(u32 *)destination = value; value = *(u32 *)source; destination -= 4; \
    source -= 4; *(u32 *)destination = value; value = *(u32 *)source; destination -= 4; \
    source -= 4; *(u32 *)destination = value; value = *(u32 *)source; \
    blocks--; destination -= 4; *(u32 *)destination = value; \
} while (0)
#define BYTES8_BACK() do { \
    source--; value = *source; destination--; \
    source--; *destination = value; value = *source; destination--; \
    source--; *destination = value; value = *source; destination--; \
    source--; *destination = value; value = *source; destination--; \
    source--; *destination = value; value = *source; destination--; \
    source--; *destination = value; value = *source; destination--; \
    source--; *destination = value; value = *source; destination--; \
    source--; *destination = value; value = *source; \
    blocks--; destination--; *destination = value; \
} while (0)
#define WORDS8_FORWARD() do { \
    value = *(u32 *)source; source += 4; blocks--; *(u32 *)destination = value; \
    value = *(u32 *)source; destination += 4; source += 4; *(u32 *)destination = value; \
    value = *(u32 *)source; destination += 4; source += 4; *(u32 *)destination = value; \
    value = *(u32 *)source; destination += 4; source += 4; *(u32 *)destination = value; \
    value = *(u32 *)source; destination += 4; source += 4; *(u32 *)destination = value; \
    value = *(u32 *)source; destination += 4; source += 4; *(u32 *)destination = value; \
    value = *(u32 *)source; destination += 4; source += 4; *(u32 *)destination = value; \
    value = *(u32 *)source; destination += 4; source += 4; *(u32 *)destination = value; \
    destination += 4; \
} while (0)
#define BYTES8_FORWARD() do { \
    value = *source; source++; blocks--; *destination = value; \
    value = *source; destination++; source++; *destination = value; \
    value = *source; destination++; source++; *destination = value; \
    value = *source; destination++; source++; *destination = value; \
    value = *source; destination++; source++; *destination = value; \
    value = *source; destination++; source++; *destination = value; \
    value = *source; destination++; source++; *destination = value; \
    value = *source; destination++; source++; *destination = value; \
    destination++; \
} while (0)

void *memory_move_overlap(void *destination_arg, u8 *source, u32 size)
{
    register u8 *destination = destination_arg;
    register s32 count;
    register s32 blocks;
    register s32 sentinel;
    register u32 words;
    register u32 value;

    if (source < destination) {
        source += size;
        destination += size;
        count = (u32)source & 3;
        if (size < count) {
            count = size;
        }
        size -= count;
        if (count != 0) {
            count--;
            if (count != -1) {
                do { BYTE_BACK(); count--; } while (count != -1);
            }
        }
        count = size & 7;
        if (((u32)destination & 3) == 0) {
            words = size >> 2;
            count = (words & 7) - 1;
            blocks = size >> 5;
            if (count != -1) {
                sentinel = -1;
                do { WORD_BACK(); count--; } while (count != sentinel);
            }
            blocks--;
            if (blocks != -1) {
                count = -1;
                do {
                    WORDS8_BACK();
                } while (blocks != count);
            }
            size -= words << 2;
            count = size & 7;
        }
        count--;
        blocks = size >> 3;
        if (count != -1) {
            size = -1;
            do { BYTE_BACK(); count--; } while (count != size);
        }
        blocks--;
        if (blocks != -1) {
            size = -1;
            do {
                BYTES8_BACK();
            } while (blocks != (s32)size);
        }
    } else {
        count = (u32)source & 3;
        if (count != 0) count = 4 - count;
        if (size < count) count = size;
        size -= count;
        if (count != 0) {
            count--;
            if (count != -1) {
                do {
                    value = *source;
                    source++;
                    count--;
                    *destination = value;
                    destination++;
                } while (count != -1);
            }
        }
        count = size & 7;
        if (((u32)destination & 3) == 0) {
            words = size >> 2;
            count = (words & 7) - 1;
            blocks = size >> 5;
            if (count != -1) {
                sentinel = -1;
                do {
                    value = *(u32 *)source;
                    source += 4;
                    count--;
                    *(u32 *)destination = value;
                    destination += 4;
                } while (count != sentinel);
            }
            blocks--;
            if (blocks != -1) {
                count = -1;
                do {
                    WORDS8_FORWARD();
                } while (blocks != count);
            }
            size -= words << 2;
            count = size & 7;
        }
        count--;
        blocks = size >> 3;
        if (count != -1) {
            size = -1;
            do {
                value = *source;
                source++;
                count--;
                *destination = value;
                destination++;
            } while (count != size);
        }
        blocks--;
        if (blocks != -1) {
            size = -1;
            do {
                BYTES8_FORWARD();
            } while (blocks != (s32)size);
        }
    }
    return destination_arg;
}
