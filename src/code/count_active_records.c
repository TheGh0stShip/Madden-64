#include "types.h"

typedef struct ActiveRecord {
    u8 pad00[0x0D];
    u8 state;
    u8 pad0E[0x1A];
} ActiveRecord;

extern ActiveRecord* D_8007343C;

u16 func_8003A50C(void) {
    u16 index = 0;
    u16 count = 0;
    ActiveRecord* records = D_8007343C;

    do {
        if (records[index].state != 0xFF) {
            count++;
        }
        index++;
    } while (index < 24);
    return count;
}
