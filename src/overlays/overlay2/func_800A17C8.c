#include "types.h"

typedef struct {
    u8 low;
    u8 high;
    u8 limit;
    u8 value;
    u8 done;
    u8 pad5;
} Range;

typedef struct {
    u8 pad00[2];
    s8 round;
    s8 teams;
} Selection;

extern u16 D_80082D94;
extern u16 D_80084EE0;
extern s16 D_800876DC;
extern void *D_800893B8;
extern Selection D_800C4EE8;
extern Range D_800C4FBC[];

void func_80024EDC(s32);
void func_8002514C(void);
void func_80031A98(void);
void func_80092B98(void);
void func_8009E3E4(void);
u8 func_800A1CC0(s16);
s16 func_800A1D20(void);
s16 func_800A1DA4(void);
s16 func_800A1E2C(void);

void func_800A17C8(void) {
    s8 found;
    s16 i;
    s16 last;
    s16 round;
    s16 cur;

    cur = D_800C4EE8.round;
    if (D_800876DC != 7) {
        D_800C4FBC[cur].limit = D_80084EE0;
        D_800C4FBC[cur].value = D_80082D94;
        D_800C4FBC[cur].done = 8;
    } else {
        D_800C4FBC[cur].limit = 0;
        D_800C4FBC[cur].value = 0;
        D_800C4FBC[cur].done = 0;
    }
    func_80024EDC(2);
    if (D_800876DC != 7) {
        func_8002514C();
    }
    found = 0;
    i = func_800A1D20();
    last = func_800A1DA4();
    round = func_800A1E2C();
    for (; i < last + 1; i++) {
        if (D_800C4FBC[i].done != 8) {
            found = 1;
            break;
        }
    }
    if (!found) {
        if (D_800C4EE8.teams == 8) {
            switch (round) {
            case 0:
                D_800C4FBC[4].low = func_800A1CC0(0);
                D_800C4FBC[4].high = func_800A1CC0(1);
                D_800C4FBC[5].low = func_800A1CC0(2);
                D_800C4FBC[5].high = func_800A1CC0(3);
                D_800C4FBC[4].done = 0;
                D_800C4FBC[5].done = 0;
                D_800C4EE8.round = 4;
                break;
            case 1:
                D_800C4FBC[6].low = func_800A1CC0(4);
                D_800C4FBC[6].high = func_800A1CC0(5);
                D_800C4FBC[6].done = 0;
                D_800C4EE8.round = 6;
                break;
            case 2:
                break;
            }
        } else {
            switch (round) {
            case 0:
                D_800C4FBC[8].low = func_800A1CC0(0);
                D_800C4FBC[8].high = func_800A1CC0(1);
                D_800C4FBC[9].low = func_800A1CC0(2);
                D_800C4FBC[9].high = func_800A1CC0(3);
                D_800C4FBC[10].low = func_800A1CC0(4);
                D_800C4FBC[10].high = func_800A1CC0(5);
                D_800C4FBC[11].low = func_800A1CC0(6);
                D_800C4FBC[11].high = func_800A1CC0(7);
                D_800C4FBC[8].done = 0;
                D_800C4FBC[9].done = 0;
                D_800C4FBC[10].done = 0;
                D_800C4FBC[11].done = 0;
                D_800C4EE8.round = 8;
                break;
            case 1:
                D_800C4FBC[12].low = func_800A1CC0(8);
                D_800C4FBC[12].high = func_800A1CC0(9);
                D_800C4FBC[13].low = func_800A1CC0(10);
                D_800C4FBC[13].high = func_800A1CC0(11);
                D_800C4FBC[12].done = 0;
                D_800C4FBC[13].done = 0;
                D_800C4EE8.round = 12;
                break;
            case 2:
                D_800C4FBC[14].low = func_800A1CC0(12);
                D_800C4FBC[14].high = func_800A1CC0(13);
                D_800C4FBC[14].done = 0;
                D_800C4EE8.round = 14;
                break;
            }
        }
    } else {
        D_800C4EE8.round = func_800A1D20();
        while (D_800C4FBC[D_800C4EE8.round].done != 0) {
            D_800C4EE8.round++;
        }
    }
    func_80092B98();
    func_80092B98();
    func_80092B98();
    func_80092B98();
    func_80031A98();
    D_800893B8 = func_8009E3E4;
}
