#include "types.h"

typedef struct {
    u8 pad0[0x14];
    u16 unk_14;
} Model;

typedef struct {
    u8 pad0[0x8];
    Model *unk_8;
    u8 padC[0xC];
    s32 unk_18;
    u8 pad1C[0x8];
    s16 unk_24;
} Body;

typedef struct {
    u8 pad0[0x24];
    Body *unk_24;
    u8 pad28[0x88];
} Player;

typedef struct {
    s32 x : 12;
    s32 y : 12;
    s32 z : 8;
    s32 w : 12;
    s32 pad : 4;
    u32 v : 16;
} Spot;

typedef struct {
    s16 x;
    s16 y;
    s16 z;
    s16 pad;
} SpotCopy;

typedef struct {
    u8 pad0[0x2540];
    Spot spots[1][30];
} Game;

typedef struct {
    u8 pad0[0x15D70];
    u8 buckets[1][30];
} GameB;

extern Game *D_800718E8;
extern Player *D_80085040[];
extern Player *D_80085098[];
extern Player D_80087138[];
extern SpotCopy D_80085190[];

s16 func_800B5DC0(Player *, s32);
u8 oriented_value_bucket(Player *);

void func_800B817C(u16 team) {
    Spot *spots;
    u8 *buckets;
    u16 i;

    spots = D_800718E8->spots[team];
    buckets = ((GameB *)D_800718E8)->buckets[team];
    for (i = 0; i < 11; i++) {
        D_80085190[i].x = spots[i].x = func_800B5DC0(D_80085040[i], 0);
        D_80085190[i].y = spots[i].y = func_800B5DC0(D_80085040[i], 1);
        {
            s32 t = D_80085040[i]->unk_24->unk_24;
            spots[i].z = t;
            D_80085190[i].z = (s8)t;
        }
        buckets[i] = oriented_value_bucket(D_80085040[i]);
        spots[i].w = D_80085040[i]->unk_24->unk_18;
        spots[i].v = D_80085040[i]->unk_24->unk_8->unk_14 >> 8;
    }
    for (i = 0; i < 11; i++) {
        D_80085190[i + 11].x = spots[i + 11].x = func_800B5DC0(D_80085098[i], 0);
        D_80085190[i + 11].y = spots[i + 11].y = func_800B5DC0(D_80085098[i], 1);
        {
            s32 t = D_80085098[i]->unk_24->unk_24;
            spots[i + 11].z = t;
            D_80085190[i + 11].z = (s8)t;
        }
        buckets[i + 11] = oriented_value_bucket(D_80085098[i]);
        spots[i + 11].w = D_80085098[i]->unk_24->unk_18;
        spots[i + 11].v = D_80085098[i]->unk_24->unk_8->unk_14 >> 8;
    }
    for (i = 0; i < 4; i++) {
        D_80085190[i + 22].x = spots[i + 22].x = func_800B5DC0(&D_80087138[i], 0);
        D_80085190[i + 22].y = spots[i + 22].y = func_800B5DC0(&D_80087138[i], 1);
        {
            s32 t = D_80087138[i].unk_24->unk_24;
            spots[i + 22].z = t;
            D_80085190[i + 22].z = (s8)t;
        }
        buckets[i + 22] = oriented_value_bucket(&D_80087138[i]);
        spots[i + 22].w = D_80087138[i].unk_24->unk_18;
        spots[i + 22].v = D_80087138[i].unk_24->unk_8->unk_14 >> 8;
    }
}
