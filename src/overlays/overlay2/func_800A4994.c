#include "types.h"

typedef struct {
    u8 pad00[0x88];
    u8 count;
    u8 ids[0x29];
} Teams;

extern s16 D_80087A92;

s32 func_800A4AF8(u32 slot);

s16 func_800A4994(Teams *teams) {
    u32 count = 0;
    u16 selected = 0xFFFF;
    u8 order[30] = {
        1, 2, 3, 4, 5, 6, 7, 8, 9, 17, 10, 12, 13, 14, 15,
        16, 11, 18, 19, 20, 21, 22, 0, 23, 24, 25, 26, 27, 28, 29,
    };
    u32 i;
    u32 id;

    for (i = 0; i < 0x29; i++) {
        id = i;
        if (i < 30) {
            id = order[i];
        }
        teams->ids[count] = 0xFF;
        if ((u8)func_800A4AF8(id) == 1) {
            if (D_80087A92 == id) {
                selected = count;
            }
            teams->ids[count] = id;
            count++;
        }
    }
    teams->count = count;
    return selected;
}
