#include "types.h"

typedef struct {
    u8 type;
    u8 group;
    u8 action;
} Msg;

typedef struct {
    u8 pad00[0x28];
    u16 flags;
} Player;

typedef struct {
    u8 pad00[0x20];
    s32 y;
} Ball;

extern s32 D_80080C10;
extern Player *D_80085040[][22];
extern Ball *D_80086178;
extern s16 D_800880B0;
extern u16 D_800886E0;
extern u16 D_80088AE4;
extern s16 D_80089320;
extern u16 D_8008B672;

s16 func_8001FA38(s32);
void func_800E1A84(Player *, Msg *);
void func_800E1BAC(Player *, Msg *);

void func_800C5F5C(void) {
    Msg msg;
    u16 team;
    s16 i;

    if (D_800880B0 == 0 && D_80086178->y > (s32)0xFCE00000 && D_80089320 != -1) {
        msg.type = 0x26;
        if (D_80080C10 & 1) {
            team = D_800886E0;
        } else {
            team = D_80088AE4;
        }
        msg.group = 0xE;
        if (func_8001FA38(0xE) != 0) {
            for (i = 0; i < D_8008B672 / 2; i++) {
                if (!(D_80085040[(s16)team][i]->flags & 0x10)) {
                    msg.action = 0x28;
                    func_800E1A84(D_80085040[(s16)team][i], &msg);
                } else {
                    msg.action = 0x19;
                    func_800E1BAC(D_80085040[(s16)team][i], &msg);
                }
            }
        }
        msg.group = 2;
        team ^= 1;
        if (func_8001FA38(2) != 0) {
            for (i = 0; i < D_8008B672 / 2; i++) {
                if (!(D_80085040[(s16)team][i]->flags & 0x10)) {
                    msg.action = 0x28;
                    func_800E1A84(D_80085040[(s16)team][i], &msg);
                } else {
                    msg.action = 0x19;
                    func_800E1BAC(D_80085040[(s16)team][i], &msg);
                }
            }
        }
    }
}
