#include "types.h"

typedef struct {
    u8 unk_00[0xC];
    u8 *unk_0C;
    u8 unk_10[0x18];
} Unk800DEC38;

extern s16 D_8006B7BC;
extern Unk800DEC38 *D_80088094;

s32 func_800DEC38(void) {
    s32 i = 0;
    s32 found = 0;
    s16 id = D_8006B7BC;
    u8 *p;

    if (id != -1) {
        p = D_80088094[id].unk_0C;
        for (i = 0; i < 5; i++, p++) {
            if (*p == id) {
                found = 1;
                break;
            }
        }
    }
    if (found) {
        return i;
    }
    return 0;
}
