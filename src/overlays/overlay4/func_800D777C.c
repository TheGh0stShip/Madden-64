#include "types.h"

typedef struct {
    u8 unk_00[0x1C];
    s32 unk_1C;
    s32 unk_20;
} Body;

typedef struct {
    u8 unk_00[0x1F];
    u8 unk_1F;
    u8 unk_20[4];
    Body *unk_24;
} Player;

extern Player *D_8008A058;
extern s32 D_80080C10;
extern s32 D_80084F34;
extern u16 D_80088AE4;
extern s8 D_8008B320;
extern s8 D_8008B321;
extern s8 D_80085A48[];
extern u32 D_800892B8;
extern u16 D_8008A5B2;
extern s16 D_800878D2;

s16 func_800C157C(Player *);
s16 func_8003BF54(u16);

s32 func_800D5EDC(Player *player) {
    Player *cur = D_8008A058;
    Body *body;
    s32 dist;
    u32 limit;
    s32 mode;
    s8 kind;

    if (cur != 0) {
        if (D_80080C10 & 8) {
            return 7;
        }
        if (cur->unk_1F == 0) {
            body = cur->unk_24;
            if (D_80084F34 - 0x300000 < body->unk_20) {
                if (((func_800C157C(cur) + 0x3FF) & 0xFFF) < 0x7FF) {
                    return 3;
                }
            } else {
                dist = body->unk_1C;
                if (dist < 0) {
                    dist = -dist;
                }
                if (dist > 0x300000) {
                    return 1;
                }
            }
        } else {
            if (D_80080C10 & 0x40) {
                return 2;
            }
            mode = 0;
            switch (func_8003BF54(D_80088AE4)) {
            case 0:
                limit = 20;
                break;
            case 2:
                limit = 0;
                break;
            default:
                limit = 10;
                break;
            }
            if (D_8008B320 == player->unk_1F || D_8008B321 == player->unk_1F || D_80085A48[player->unk_1F] == 5) {
                mode = 2;
            }
            kind = D_80085A48[player->unk_1F];
            if (kind == 6) {
                mode = 1;
            } else if (kind == 4) {
                mode = 3;
            }
            switch (mode) {
            case 1:
                limit += 2;
                break;
            case 3:
                limit += 6;
                break;
            case 2:
                limit += 30;
                break;
            }
            if (limit < D_800892B8) {
                return 6;
            }
        }
    } else if (D_8008A5B2 != 5) {
        if (D_8008A5B2 == 3) {
            return (D_800878D2 >= 10) ? 5 : 0;
        }
        if (D_8008A5B2 == 2) {
            if (D_80080C10 & 8) {
                return 7;
            }
            if (D_80080C10 & 0x40) {
                return 2;
            }
        } else if (D_8008A5B2 != 9) {
            return 7;
        }
    }
    return 0;
}
