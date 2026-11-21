#include "types.h"

typedef struct {
    u8 unk_00[4];
    u8 unk_04;
} Unk8008DC10;

Unk8008DC10 *func_8008DC10(s16 arg0, s16 arg1);
void func_800167FC(s8 arg0, char *arg1);

extern u8 D_8006BB08[];
extern u8 D_8006BB20[];
extern s8 D_8006BB30[];
extern u8 D_8006BB40[][5];
extern char D_8007A188[];
extern char D_8007A18D[];

char *func_8008DC54(s16 arg0, s16 arg1) {
    s8 month = D_8006BB08[arg0];
    s8 day = D_8006BB20[arg0];
    s32 i;
    u8 *p;
    s32 idx;

    switch (func_8008DC10(arg0, arg1)->unk_04 >> 4) {
        case 0:
            break;
        case 4:
            day += 1;
            break;
        case 5:
        case 6:
        case 7:
            day += 4;
            break;
        case 8:
        case 9:
        case 10:
            day += 6;
            break;
        case 11:
        case 12:
        case 13:
            day += 7;
            break;
        case 14:
            day += 8;
            break;
    }
    if (D_8006BB30[month] < day) {
        day -= D_8006BB30[month];
        month++;
    }
    idx = month - 8;
    p = D_8006BB40[idx];
    for (i = 0; i < 5; i++) {
        D_8007A188[i] = p[i];
    }
    if (month == 9) {
        D_8007A18D[0] = ' ';
        func_800167FC(day, D_8007A18D + 1);
    } else {
        func_800167FC(day, D_8007A18D);
    }
    return D_8007A188;
}
