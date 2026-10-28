#include "types.h"

typedef struct {
    u8 pad00[0x28];
    u16 flags;
} Player;

typedef struct {
    Player *members[22];
} Group;

extern u32 D_80080C10;
extern Group D_80085040[];
extern s16 D_800876DC;
extern s16 D_80087904;
extern u16 D_80087A60;
extern u16 D_80087AAC;
extern s16 D_800886E0;
extern u16 D_80088AE4;
extern u16 D_8008B672;

void func_800A3294(void);
void func_800CC18C(void);
void func_800DBFA8(void);

void func_800A307C(void) {
    u16 old;
    u16 new;
    s32 i;
    u32 flags;

    old = D_80088AE4;
    new = old ^ 1;
    D_800886E0 = old;
    D_80088AE4 = new;
    D_80087904 = D_80087A60 - D_80087AAC + (s16)D_80087A60 * (D_800876DC - 1);
    flags = D_80080C10;
    if (flags & 1) {
        D_80080C10 |= 0x800000;
    }
    D_80080C10 &= ~0x2000000;
    for (i = 0; i < (s32)(D_8008B672 >> 1); i++) {
        (D_80085040 + (s16)new)->members[i]->flags = ((D_80085040 + (s16)new)->members[i]->flags | 8) & ~0x20;
        (D_80085040 + (s16)old)->members[i]->flags &= ~0x28;
    }
    i = D_80080C10;
    D_80080C10 = i & ~6;
    if (i & 2) {
        D_80080C10 = (i & ~6) | 4;
    }
    if (i & 4) {
        D_80080C10 |= 2;
    }
    D_80080C10 ^= 1;
    func_800A3294();
    func_800CC18C();
    func_800DBFA8();
}
