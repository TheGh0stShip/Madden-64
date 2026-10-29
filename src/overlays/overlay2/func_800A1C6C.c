#include "types.h"

typedef struct {
    u8 pad[12];
    u8 id;
} Entry;

typedef struct {
    s8 count;
    Entry entries[1];
} Roster;

extern Roster D_800C4EEB;

/* The original falls off the end when no entry matches (no return statement); the caller only
 * uses the result after a successful lookup. */
Entry *func_800A1C6C(u8 id) {
    u32 i;

    for (i = 0; i < D_800C4EEB.count; i++) {
        if (D_800C4EEB.entries[i].id == id) {
            return &D_800C4EEB.entries[i];
        }
    }
}
