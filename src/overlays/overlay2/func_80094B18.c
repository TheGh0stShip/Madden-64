#include "types.h"

typedef struct { u8 pad[2]; s8 unk2; s8 unk3; u8 unk4; } Hdr;
typedef struct {
    u8 id;
    u8 unk1;
    u8 unk2;
} Pick;
typedef struct {
    u8 unk0;
    s8 ids[3];
    u8 (*func)(s32, s32);
} Event;

typedef struct { u8 pad[0x214C]; } Rec;
extern Rec D_80080D6A[];
extern u8 D_80082DDC;
extern s32 D_80085138[];
extern u16 D_800892B4;
extern u16 D_800892B6;
extern Hdr *D_8008934C;
extern s32 D_80089490[];
extern s16 D_80089598[];
extern u32 D_8008B260;
extern Event D_800C3960[];
typedef struct { s8 mode; } Mode;
extern Mode D_800C509C;
extern Hdr D_800C56D4[];
extern Hdr D_800C572E[];
extern Hdr D_800C5788[];
extern Pick D_800C5A3A[5];
extern Pick D_800C5A4C[5];
u16 func_80031A1C(u16);
u16 func_8003B02C(Rec *);
u16 func_8003B3A0(Rec *);

void func_80094B18(void) {
    s8 teams[2];
    u8 weights[21];
    u8 picks[21];
    s32 i;
    s32 j;
    u8 count;
    u8 last;
    s32 team;
    s32 other;
    s32 total;
    Rec *rec;
    Rec *base;
    s32 same;
    s32 code;
    s8 *ids;
    u32 n;

    teams[0] = teams[1] = -1;
    D_8008B260 = 0;
    last = 0xFF;
    if (D_80089490[0] != -1) {
        for (i = 0; D_80089490[i] != -1; i++) {
            teams[D_80089598[D_80089490[i]]] = 0;
        }
    } else {
        teams[func_80031A1C(2)] = 0;
    }
    if (teams[0] != -1) {
        teams[0] = D_800892B6;
        if (teams[1] != -1) {
            teams[1] = D_800892B4;
        }
    } else {
        teams[0] = D_800892B4;
        teams[1] = -1;
    }
    switch (D_800C509C.mode) {
    case 0:
        D_80085138[D_8008B260] = 0x96;
        D_8008B260++;
        break;
    case 17:
        n = (u32)D_8008934C;
        n = (n - (u32)D_800C56D4) / 6;
        if (n < 2) {
            n = 0x98;
            D_80085138[D_8008B260] = n;
        } else {
            n = 0x99;
            D_80085138[D_8008B260] = n;
        }
        D_8008B260++;
        break;
    case 18:
        n = (u32)D_8008934C;
        n = (n - (u32)D_800C572E) / 6;
        if (n < 2) {
            n = 0x90;
            D_80085138[D_8008B260] = n;
        } else {
            n = 0x8F;
            D_80085138[D_8008B260] = n;
        }
        D_8008B260++;
        break;
    case 19:
        n = (u32)D_8008934C;
        n = (n - (u32)D_800C5788) / 6;
        if (n == 0) {
            n = 0x8E;
            D_80085138[D_8008B260] = n;
        } else {
            n = 0x91;
            D_80085138[D_8008B260] = n;
        }
        D_8008B260++;
        break;
    case 20:
        if (func_80031A1C(100) < 50) {
            D_80085138[D_8008B260] = 0x94;
        } else {
            D_80085138[D_8008B260] = 0x95;
        }
        D_8008B260++;
        break;
    case 21:
        D_80085138[D_8008B260] = 0x92;
        D_8008B260++;
        return;
    }
    base = D_80080D6A;
    for (i = 0; i < 2; i++) {
        if (teams[i] == -1) {
            continue;
        }
        team = teams[i];
        other = (team != (s16)D_800892B4) ? (s16)D_800892B4 : (s16)D_800892B6;
        D_80085138[D_8008B260] = teams[i] * 2 + (code = i + 0x4B);
        D_8008B260++;
        if (D_800C509C.mode < 17) {
            s32 pick;

            count = 0;
            for (j = 0; j < 21; j++) {
                if (j == last) {
                    continue;
                }
                weights[count] = D_800C3960[j].func(team, other);
                if (weights[count] != 0) {
                    picks[count] = j;
                    count++;
                }
            }
            if (count != 0) {
                total = 0;
                for (j = 0; j < count; j++) {
                    total += weights[j];
                }
                if (total != 0) {
                    total = func_80031A1C(total);
                    while (total >= 0) {
                        j--;
                        total -= weights[j];
                    }
                    pick = picks[j];
                } else {
                    pick = picks[0];
                }
            } else {
                same = team == D_80082DDC;
                rec = (Rec *)(same * 0x214C);
                rec = (Rec *)((s32)rec + (s32)base);
                pick = func_8003B02C(rec) >= func_8003B3A0(rec);
            }
            ids = D_800C3960[pick].ids;
            for (j = 0; j < 3; j++) {
                if (ids[j] == 0) {
                    break;
                }
            }
            D_80085138[D_8008B260] = ids[func_80031A1C(j)];
            D_8008B260++;
            last = pick;
        } else {
            switch (D_800C509C.mode) {
            case 17:
                if (teams[i] == D_800C5A3A[2].id || teams[i] == D_800C5A4C[2].id) {
                    D_80085138[D_8008B260] = 0x3A;
                } else {
                    D_80085138[D_8008B260] = 0x3B;
                }
                D_8008B260++;
                break;
            case 18:
                if (teams[i] == D_800C5A3A[0].id || teams[i] == D_800C5A4C[0].id) {
                    D_80085138[D_8008B260] = 0x17;
                } else if (teams[i] == D_800C5A3A[1].id || teams[i] == D_800C5A4C[1].id) {
                    D_80085138[D_8008B260] = 0x16;
                } else {
                    D_80085138[D_8008B260] = 0x18;
                }
                D_8008B260++;
                break;
            case 19:
                D_80085138[D_8008B260] = 0x15;
                D_8008B260++;
                teams[1] = -1;
                break;
            case 20:
                D_80085138[D_8008B260] = 0x39;
                D_8008B260++;
                teams[1] = -1;
                break;
            }
        }
    }
}
