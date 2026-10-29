#include "types.h"

extern u16 D_8006B9E4[];
extern u16 D_80086190[];

u8 func_80028A58(u8 id);
s16 func_8002B5EC(void);
u8 func_80092E08(u8 id);

/* Previous team id before ID in a cycle of COUNT. */
u8 func_80092BD0(u8 id, u8 count, u8 mode) {
    u8 result = 0xFF;
    u8 searching = 1;
    u16 *order;
    u8 pos;

    if (mode != 0) {
        pos = func_80028A58(id);
        if (func_8002B5EC() == 1) {
            order = D_80086190;
        } else {
            order = D_8006B9E4;
        }
        if (pos == 0 || pos >= count) {
            pos = count - 1;
        } else {
            pos--;
        }
        result = order[pos];
    } else {
        do {
            if (id == 0 || id >= count) {
                id = count - 1;
            } else {
                id--;
            }
            if (id < 0x74 || func_80092E08(id) != 0) {
                result = id;
                searching = 0;
            }
        } while (searching != 0);
    }
    return result;
}
