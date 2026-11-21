#include "types.h"

typedef struct {
    char c[5];
} Lit5;

typedef struct {
    char c[6];
} Lit6;

typedef struct {
    char c[2];
} Lit2;

void func_800167FC(s16, u8 *);
extern Lit5 D_800019C8;
extern Lit6 D_800019D0;
extern Lit2 D_800019D8;
extern u8 D_8007A250[];
extern u8 D_8007A251;
extern u8 D_8007A252;
extern u8 D_8007A253;
extern u8 D_8007A254;

u8 *func_80092EC4(s8 *counts) {
    s16 total;
    s16 pct;

    D_8007A250[0] = 0;
    total = counts[0] + counts[1] + counts[2];
    if (total == 0) {
        *(Lit5 *)D_8007A250 = D_800019C8;
    } else {
        pct = (counts[0] * 1000) / total;
        if (pct == 1000) {
            *(Lit6 *)D_8007A250 = D_800019D0;
        } else {
            *(Lit2 *)D_8007A250 = D_800019D8;
            func_800167FC(pct, D_8007A250 + 1);
        }
        if (pct < 100) {
            u8 c2 = D_8007A252;
            u8 c1 = D_8007A251;
            D_8007A251 = '0';
            D_8007A254 = 0;
            D_8007A253 = c2;
            D_8007A252 = c1;
        }
    }
    if (D_8007A250[2] == 0) {
        D_8007A250[3] = '0';
        D_8007A250[2] = '0';
        D_8007A250[4] = 0;
    }
    if (D_8007A250[3] == 0) {
        D_8007A250[3] = '0';
        D_8007A250[4] = 0;
    }
    return D_8007A250;
}
