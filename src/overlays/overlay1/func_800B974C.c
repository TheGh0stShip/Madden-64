#include "types.h"

typedef struct {
    u32 unk00_27 : 5;
    u32 unk00_22 : 5;
    u32 unk00_17 : 5;
    u32 unk00_12 : 5;
    s32 y : 12;
    u32 unk04_27 : 5;
    u32 unk04_22 : 5;
    u32 unk04_17 : 5;
    u32 unk04_12 : 5;
    u32 unk04_07 : 5;
    u32 sound : 7;
    s32 x : 11;
    s32 z : 10;
    u32 unk08_07 : 4;
    u32 kind : 4;
    u32 volume : 3;
    s32 rx : 10;
    s32 ry : 10;
    s32 rz : 10;
    u32 visible : 1;
    u32 unk0C_00 : 1;
} PlayEntry;

typedef struct SObj {
    u8 pad00[8];
    struct SObj *unk08;
    u8 pad0C[4];
    s16 unk10;
    s16 unk12;
    s32 flags;
    u8 pad18[4];
    s32 x;
    s32 y;
    s32 z;
} SObj;

typedef struct {
    void *members[22];
} Group;

typedef struct {
    u8 pad00[0xC];
    SObj *target;
} Camera;

extern u8 *D_800718E8;
extern s32 D_800718F0;
extern Group D_80085040[];
extern s8 D_80085E50[];
extern SObj *D_80086178;
extern s32 D_80086C60;
typedef struct { s16 x; u16 y; s16 z; } Rot;
extern Rot D_800876E0;
extern SObj *D_8008794C;
extern SObj *D_80087B54;
extern s16 D_80089308[];
extern Camera D_8008A5E0;
extern s16 D_8008AF80;
extern u16 D_8008B1F8[];
extern u32 D_8008B368;

void func_8000EC8C(SObj *, Rot *);
void func_8003CF78(s32, s32);
void func_80096A00(s32, u16);
void func_800B545C(u16);
void func_800B56DC(u16);

void func_800B5028(s32 arg0) {
    PlayEntry *entry;
    u8 *owner;

    entry = (PlayEntry *)(D_800718E8 + 0x40) + (u16)arg0;
    owner = D_800718E8 + 0x1A2D0 + (u16)arg0;
    if (D_8008AF80 == 2) {
        if (entry->volume != 0) {
            func_8003CF78(entry->sound, entry->volume * 2);
        }
    }
    D_80086178->x = entry->x << 16;
    D_80086178->y = entry->y << 16;
    D_80086178->z = entry->z << 16;
    D_800876E0.x = entry->rx << 2;
    D_800876E0.y = entry->ry << 2;
    D_800876E0.z = entry->rz << 2;
    if (entry->visible) {
        D_80086178->flags |= 1;
    } else {
        D_80086178->flags &= ~1;
    }
    if (D_80087B54 != 0) {
        if (D_80086178->flags & 1) {
            D_80087B54->flags |= 1;
            D_80087B54->x = D_80086178->x;
            D_80087B54->y = D_80086178->y;
            D_80087B54->unk08->unk12 = D_800876E0.y + 0x400;
        } else {
            D_80087B54->flags &= ~1;
        }
    }
    func_8000EC8C(D_80086178, &D_800876E0);
    {
        u32 n = (u16)arg0;
        if ((n & 7) == 0) {
            func_800B545C(n >> 3);
        } else {
            func_800B56DC(arg0 - (n >> 3) - 1);
        }
    }
    if ((*owner & 0xC0) != 0xC0) {
        {
            s32 team = (s8)*owner >> 6;
            Group *g = D_80085040;
            D_8008B368 = (u32)g[team].members[(*owner >> 2) & 0xF];
        }
    } else {
        D_8008B368 = 0;
    }
    if (D_800718F0 == 0) {
        if (D_8008A5E0.target != D_8008794C && D_8008A5E0.target != 0) {
            if (D_8008A5E0.target->x > 0x1900000) {
                D_8008794C->flags |= 1;
                D_8008A5E0.target = D_8008794C;
                D_8008794C->x = 0x1900000;
                D_8008794C->y = D_8008A5E0.target->y;
            } else if (D_8008A5E0.target->x < -0x1900000) {
                D_8008794C->flags |= 1;
                D_8008A5E0.target = D_8008794C;
                D_8008794C->x = -0x1900000;
                D_8008794C->y = D_8008A5E0.target->y;
            }
        }
    }
    func_80096A00(D_80086C60, D_8008B1F8[D_80089308[entry->kind]]);
    D_80085E50[0] = entry->unk00_27;
    if (D_80085E50[0] == 0x1F) {
        D_80085E50[0] = -1;
    }
    D_80085E50[1] = entry->unk00_22;
    if (D_80085E50[1] == 0x1F) {
        D_80085E50[1] = -1;
    }
    D_80085E50[2] = entry->unk00_17;
    if (D_80085E50[2] == 0x1F) {
        D_80085E50[2] = -1;
    }
    D_80085E50[3] = entry->unk00_12;
    if (D_80085E50[3] == 0x1F) {
        D_80085E50[3] = -1;
    }
    D_80085E50[4] = entry->unk04_27;
    if (D_80085E50[4] == 0x1F) {
        D_80085E50[4] = -1;
    }
    D_80085E50[5] = entry->unk04_22;
    if (D_80085E50[5] == 0x1F) {
        D_80085E50[5] = -1;
    }
    D_80085E50[6] = entry->unk04_17;
    if (D_80085E50[6] == 0x1F) {
        D_80085E50[6] = -1;
    }
    D_80085E50[7] = entry->unk04_12;
    if (D_80085E50[7] == 0x1F) {
        D_80085E50[7] = -1;
    }
    D_80085E50[8] = entry->unk04_07;
    if (D_80085E50[8] == 0x1F) {
        D_80085E50[8] = -1;
    }
}
