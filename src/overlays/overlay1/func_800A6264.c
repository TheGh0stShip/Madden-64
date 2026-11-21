#include "types.h"

typedef struct {
    u8 pad00[0x1E];
    u8 team;
    u8 pad1F[2];
    u8 flags;
} Player;

typedef struct {
    u8 pad00[0xC];
    s32 (*callback)(s32, void *);
    void *data;
    s32 unk14;
    u8 pad18[0xC];
    s32 unk24;
    u8 pad28[4];
    s32 unk2C;
    s32 unk30;
    s32 unk34;
    u8 pad38[4];
    s16 unk3C;
    s16 unk3E;
    s32 unk40;
    s32 unk44;
} Task;

typedef struct {
    s32 x;
    s32 y;
    s32 z;
} Vec3i;

extern u8 D_80069BA8[];
extern u8 D_80080810[];
extern s16 D_8008081C;
extern s8 D_80080831;
extern Task *D_80080834[];
extern s16 D_80080838;
extern s16 D_8008085C;
extern s32 D_80085298;
extern Player *D_80087FA0;
extern s32 D_80087FA4[];
extern s16 D_80088AE4;

Task *func_8000D740(s32, s32, void *);
void func_8000EC58(Task *);
void func_8000ECE4(Task *, Vec3i *);
void func_8000F31C(void);
void func_800A1CDC(void *);
s32 func_800A1D28(s32, void *);
void func_800BD734(s32);
void func_800BD79C(s32);

s32 func_800A6264(s32 arg0, Player *player) {
    Vec3i scale;
    Task *task;

    if (arg0 == 1) {
        D_80087FA0 = player;
        if ((player->flags & 0xC0) == 0x40) {
            if (player->team == D_80088AE4) {
                func_800BD79C(player->flags & 0x3F);
            } else {
                func_800BD734(player->flags & 0x3F);
            }
        }
        D_80080831 = 0;
        D_80080838 = 0;
        D_8008085C = 0;
        func_8000F31C();
        if (D_80088AE4 != 0) {
            task = func_8000D740(D_80085298, 8, D_80069BA8);
            D_80080834[0] = task;
            func_8000EC58(task);
        } else {
            task = func_8000D740(D_80085298, 8, D_80069BA8);
            D_80080834[0] = task;
            func_8000EC58(task);
        }
        scale.x = 0x3126;
        scale.y = 0x3126;
        scale.z = 0x3126;
        func_8000ECE4(D_80080834[0], &scale);
        func_800A1CDC(D_80080810);
        D_80080834[0]->unk24 = 0;
        D_80080834[0]->unk2C = 0;
        D_80080834[0]->unk30 = 0;
        D_80080834[0]->unk34 = 0;
        D_80080834[0]->unk3E = 0;
        D_80080834[0]->unk3C = 0x32;
        D_80080834[0]->unk40 = 0x1000;
        D_80080834[0]->unk44 = 0;
        D_80080834[0]->unk14 = 0x30;
        D_80080834[0]->data = D_80080810;
        D_8008081C = 2;
        D_80080834[0]->callback = func_800A1D28;
        D_80087FA4[0] = 0;
    }
    return 1;
}
