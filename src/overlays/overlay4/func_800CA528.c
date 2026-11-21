#include "types.h"

typedef struct {
    u8 pad00[0x1C];
    s32 x;
    s32 y;
    u8 pad24[8];
    s32 unk2C;
    s32 unk30;
} Body;

typedef struct {
    u8 pad00[0xE];
    u8 unkE;
    u8 pad0F[0x15];
    Body *body;
    u16 unk28;
} Player;

extern u32 D_80080C10;
extern s16 D_80084F6E;
extern Body *D_80086178;
extern s16 D_800876F6;
typedef struct {
    s8 unk0;
    s16 unk2;
    s16 unk4;
    u8 pad6[6];
    Player *unkC;
} Event;

extern Event D_80087AB0;
extern s16 D_80087AF0;
extern s16 D_80088AE4;
extern s16 D_8008A5B2;

u16 func_80031A1C(s32);
void func_80041DD4(s32, s32, s32);
void func_8009CA5C(s32, s32);
void func_800C1368(void);
void func_800C1838(void);
void func_800C2DA0(void);
void func_800C5F80(void);
void func_800C7368(Player *);
void func_800C872C(void);

s32 func_800CA528(Player *player) {
    u32 flags;

    flags = D_80080C10;
    if (flags & 1) {
        if (player->unk28 & 8) {
            D_80084F6E = 6;
            func_800C872C();
            D_800876F6 = 0;
            func_800C2DA0();
            D_80087AF0 = 70;
            if (D_80080C10 & 0x4000000) {
                D_80087AB0.unk0 = 0x16;
                D_80087AB0.unk2 = D_80086178->x >> 16;
                D_80087AB0.unk4 = D_80086178->y >> 16;
                D_80087AB0.unkC = player;
                func_800C5F80();
                func_8009CA5C(11, 0xD2);
                func_800C1838();
                return 0;
            }
            if (D_80088AE4 == 0) {
                func_80041DD4(0x3A, 0xF, 6000);
            }
            return 0;
        }
        D_80087AB0.unk0 = 11;
        D_80087AB0.unkC = 0;
        D_80087AB0.unk2 = player->body->x >> 16;
        if (flags & 0x8000) {
            D_80087AB0.unk4 = -0x321;
        } else {
            D_80087AB0.unk4 = player->body->y >> 16;
        }
        D_80086178->unk30 = 0;
        D_80086178->unk2C = 0;
        func_800C5F80();
        D_80087AF0 = 70;
        func_8009CA5C(0x2D, 0xD2);
        return 0;
    }
    if (!(player->unk28 & 8) && func_80031A1C(0xFF) < player->unkE + 100) {
        D_80087AB0.unk0 = 0x1F;
        D_80087AB0.unkC = player;
        D_80087AB0.unk2 = player->body->x >> 16;
        D_8008A5B2 = 6;
        D_80080C10 &= ~0x100;
        D_80087AB0.unk4 = player->body->y >> 16;
        func_800C5F80();
        func_800C7368(player);
        func_800C1368();
    }
    return 0;
}
