#include "types.h"

typedef struct {
    u8 low;
    u8 high;
    u8 limit;
    u8 value;
    u8 kind;
    u8 pad;
} Range;

extern s8 D_800C4EEB;
extern Range D_800C4FBC[];

s32 func_800A1EB0(void) {
    s16 count;
    s16 i;

    count = 7; if (D_800C4EEB != 8) { count = ((D_800C4EEB == 16) ? 15 : 0) | 7; }
    for (i = 0; i < count; i++) {
        if (D_800C4FBC[i].kind == 8) {
            return 1;
        }
    }
    return 0;
}
