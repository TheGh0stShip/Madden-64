#include "types.h"

typedef struct {
    u8 kind;
    u8 pad[3];
} Slot;

typedef struct {
    Slot slots[10];
    s32 count;
    u8 pad2C[0xB0 - 0x2C];
} Lineup;

extern s32 D_8008A054;
extern Lineup D_8008719C[];

u16 func_800E0E24(void);

s32 func_800A33C8(void) {
    s16 i;
    s16 j;
    u8 kind;

    if (D_8008A054 != 0) {
        return 1;
    }
    if (func_800E0E24() != 0) {
        return 1;
    }
    for (i = 0; i < 4; i++) {
        for (j = 0; j < 10; j++) {
            kind = D_8008719C[i].slots[j].kind;
            switch (kind) {
                case 0x36:
                    if (D_8008719C[i].count >= 2) {
                        break;
                    }
                case 0x35:
                    return 1;
                case 0:
                case 0x34:
                    j = 10;
                    break;
            }
        }
    }
    return 0;
}
