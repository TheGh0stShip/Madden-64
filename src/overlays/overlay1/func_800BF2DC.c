#include "types.h"

typedef struct {
    u8 id;
    u8 pad01[3];
} Entry;

typedef struct {
    u8 pad00[0x64];
    Entry entries[10];
} Holder;

s32 func_800BF2DC(Holder *arg0) {
    s16 i;
    u8 id;

    for (i = 0; i < 10; i++) {
        id = arg0->entries[i].id;
        if (id == 0) {
            break;
        }
        if (id == 0x13) {
            return 1;
        }
    }
    return 0;
}
