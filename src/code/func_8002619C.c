#include "types.h"

typedef struct {
    u8 pad0[0xB7A];
    s16 grid[0x37][0x2F];
    u8 pad1FAC[0x7A];
    s16 list[0x17];
    u8 pad2054[0x2E];
    s8 bytes[6];
    u8 pad2088[0xC4];
} Team2619C;

void func_80025AB8(void);
extern Team2619C D_80080CFC[2];
extern s8 D_800895D0;
extern s8 D_800895D8;

void func_8002619C(void) {
    s16 i;
    s16 j;

    for (i = 0; i < 0x37; i++) {
        for (j = 0; j < 0x2F; j++) {
            D_80080CFC[0].grid[i][j] = 0;
            D_80080CFC[1].grid[i][j] = 0;
        }
    }
    for (i = 0; i < 0x17; i++) {
        D_80080CFC[0].list[i] = 0;
        D_80080CFC[1].list[i] = 0;
    }
    for (i = 0; i < 6; i++) {
        D_80080CFC[0].bytes[i] = 0;
        D_80080CFC[1].bytes[i] = 0;
    }
    func_80025AB8();
    D_800895D8 = 0;
    D_800895D0 = 0;
}
