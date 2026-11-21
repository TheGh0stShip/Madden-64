#include "types.h"

typedef struct {
    u8 pad_00[4];
    u8 unk_04;
} GameEntry;

extern char D_8007A198[];
extern char D_8000144C[];

GameEntry *func_8008DC10(s16, s16);
void func_800167FC(s32, char *);
void func_8002E688(char *, char *);

char *func_8008DDB8(s16 team, s16 week) {
    s8 minutes;
    s8 seconds = 0;

    switch (func_8008DC10(team, week)->unk_04 >> 4) {
        case 1:
        case 9:
        case 11:
            minutes = 1;
            break;
        case 2:
        case 6:
        case 10:
        case 12:
            minutes = 4;
            break;
        case 4:
        case 14:
            minutes = 9;
            break;
        case 0:
        case 5:
        case 8:
            minutes = 12;
            seconds = 30;
            break;
        case 3:
        case 7:
        case 13:
            minutes = 8;
            break;
    }
    if (team == 20) {
        minutes = 6;
        seconds = 18;
    }
    if (team == 21) {
        minutes = 5;
        seconds = 0;
    }
    func_800167FC(minutes, D_8007A198);
    if (minutes < 10) {
        D_8007A198[1] = ':';
        func_800167FC(seconds, &D_8007A198[2]);
        if (seconds < 10) {
            D_8007A198[3] = D_8007A198[2];
            D_8007A198[2] = '0';
            D_8007A198[4] = 0;
        } else {
            D_8007A198[4] = 0;
        }
    } else {
        D_8007A198[2] = ':';
        func_800167FC(seconds, &D_8007A198[3]);
        if (seconds < 10) {
            D_8007A198[4] = D_8007A198[3];
            D_8007A198[3] = '0';
            D_8007A198[5] = 0;
        } else {
            D_8007A198[5] = 0;
        }
    }
    func_8002E688(D_8007A198, D_8000144C);
    return D_8007A198;
}
