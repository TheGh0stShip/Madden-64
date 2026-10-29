#include "types.h"
typedef struct { s8 id; u8 pad[12]; } NameRecord;
typedef struct { u8 home; u8 away; u8 pad[2]; s8 x4; s8 x5; } Matchup;
extern s8 D_800C4EEB;
extern s8 D_800C4EEA;
extern u16 D_800C4EE8;
extern NameRecord D_800C4EF8[];
extern Matchup D_800C4FBC[];
extern s16 D_80086190[];
extern s16 D_8006B9E4[];
extern s16 D_8006B9E0;
extern s16 D_80073446;
void func_80025114(void);
void func_80024694(void);
void func_80039850(s32, s32);
void func_80024E9C(void);

void func_8009E064(void) {
    s16 i;
    s8 team;
    s8 *count;
    s8 *count2;

    count = &D_800C4EEB;
    for (i = 0; i < *count; i++) {
        D_800C4EF8[i].id = i;
        D_80086190[i] = i;
        D_8006B9E4[i] = i;
    }
    D_8006B9E0 = D_800C4EEB;
    for (i = 0; i < 16; i++) {
        D_800C4FBC[i].x4 = 0;
        D_800C4FBC[i].x5 = 1;
        D_800C4FBC[i].home = 0xFF;
        D_800C4FBC[i].away = 0xFF;
    }
    count2 = &D_800C4EEB;
    team = 0;
    for (i = 0; i < *count2 / 2; i++) {
        D_800C4FBC[i].home = team++;
        D_800C4FBC[i].away = team++;
    }
    D_800C4EEA = 0;
    D_800C4EE8 = 0x5AA5;
    func_80025114();
    if (D_80073446 == 0) {
        func_80024694();
        func_80039850(1, 2);
        func_80024E9C();
    }
}
