#include "types.h"

typedef struct {
    u8 pad0[0x4];
    u16 unk_4;
    u16 unk_6;
} PlayInfo;

typedef struct {
    u8 pad0[0x24];
    void *unk_24;
} SPl;

extern PlayInfo *D_800718E8;
extern SPl *D_80085040[][22];
extern void *D_80086178;
extern s32 D_8007A210;
extern s32 D_8007A218;
extern s32 D_8007A220;
extern s32 D_8007A224;
extern s32 D_8007A228;
extern s32 D_8007A23C;
extern s32 D_8007A240;
extern s32 D_8007A248;
extern void *D_8006A9B4;
extern s16 D_80087988;
extern s16 D_80086BE0;
extern u8 D_8008A5E0[];
extern const char D_80001630[];
extern const char D_80001648[];
extern const char D_8000165C[];
extern const char D_80001674[];

u8 func_800A6580(void);
void func_800B3108(u8, u16, u8);
void func_800B2FB4(void);
s32 func_80031964(void);
s32 func_80031A1C(s32);
void func_800A6590(u8 *, s32);
void func_800B6378(void *);
void func_8002CA88(const char *, ...);

void func_800B3224(s32 arg0, s32 arg1, s32 arg2) {
    u16 limit;
    s32 buttons;
    void *alt;
    void *play;

    s32 sel;

    D_8007A248 = func_800A6580();
    sel = (u16)arg1;
    if ((u8)sel == 40) {
        D_8007A228 = 3;
        func_800B3108((u8)arg0, sel, (u8)arg2);
        return;
    }
    func_800B2FB4();
    limit = D_800718E8->unk_6;
    alt = D_80085040[(u8)arg0][(u8)arg2]->unk_24;
    buttons = func_80031964();
    if (buttons & 0x20) {
        D_8007A220 = -1;
    } else {
        D_8007A220 = 1;
    }
    D_8007A210 = 0x500;
    if (!(buttons & 0x100)) {
        D_8007A218 = 0x800;
    } else {
        D_8007A218 = 0;
    }
    play = D_80086178;
    D_8007A23C = (buttons & 1) + 14;
    D_8007A240 = 0x800000;
    D_8007A224 = D_800718E8->unk_4;
    switch ((u8)arg1) {
    case 8:
    case 17:
        limit = 50;
        D_8007A228 = 2;
        play = alt;
        break;
    case 33:
    case 34:
    case 35:
    case 45:
        D_8007A224 = -1;
        {
            s32 *p = &D_8007A218;
            if (limit == 0) {
                *p = 0x800;
            } else {
                *p = 0;
            }
        }
        D_8007A228 = 4;
        D_8007A23C += 2;
        limit = 10;
        break;
    case 29:
    case 30:
    case 31:
    case 32:
        {
            s32 *p = &D_8007A218;
            if (limit == 0) {
                *p = 0x800;
            } else {
                *p = 0;
            }
        }
        D_8007A228 = 5;
        limit = 10;
        break;
    case 1:
    case 7:
    case 16:
    case 18:
    case 19:
    case 20:
    case 21:
    case 39:
        limit = 10;
        play = alt;
        D_8007A228 = 1;
        break;
    default:
        limit = 10;
        D_8007A228 = 0;
        break;
    }
    buttons = func_80031A1C(100);
    if (func_800A6580() != 7 && (u16)buttons < limit) {
        play = alt;
        D_8006A9B4 = alt;
        func_800A6590(D_8008A5E0, 7);
    }
    func_800B6378(play);
    if (play != D_80086178) {
        D_80087988 = (u8)arg0;
        D_80086BE0 = (u8)arg2;
    }
    func_8002CA88(D_80001630, D_8007A224);
    func_8002CA88(D_80001648, D_8007A228);
    func_8002CA88(D_8000165C, D_8007A220);
    func_8002CA88(D_80001674, D_8007A218);
}
