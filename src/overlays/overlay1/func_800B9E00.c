#include "types.h"

typedef struct {
    s32 dx : 5;
    s32 dy : 5;
    s32 dz : 5;
    u32 anim : 10;
    u32 frame : 7;
} Formation;

typedef struct {
    u8 pad0[0x18];
    s32 unk_18;
    s32 x;
    s32 y;
    s32 z;
} Body;

typedef struct {
    u8 pad0[0x24];
    Body *body;
    u8 pad28[0x88];
} Player;

typedef struct {
    u8 pad0[0x6AA0];
    Formation form[2][30];
    u8 pad6B90[0xFA8C];
    u8 dir[2][30];
} SaveData;

void func_800C16A0(Player *, s32);
u16 masked_lookup_value(Body *, s32, s32);
extern SaveData *D_800718E8;
extern Player *D_80085040[][22];
extern Player D_80087138[];

void func_800B56DC(u16 team) {
    Formation *form = D_800718E8->form[team];
    u8 *dir = D_800718E8->dir[team];
    Player *pl;
    u16 i;

    for (i = 0; i < 11; i++) {
        pl = D_80085040[0][i];
        pl->body->x += form[i].dx << 16;
        pl->body->y += form[i].dy << 16;
        pl->body->z += form[i].dz << 16;
        func_800C16A0(pl, dir[i] << 4);
        pl->body->unk_18 = masked_lookup_value(pl->body, form[i].anim, form[i].frame);
    }
    for (i = 0; i < 11; i++) {
        pl = D_80085040[1][i];
        pl->body->x += form[i + 11].dx << 16;
        pl->body->y += form[i + 11].dy << 16;
        pl->body->z += form[i + 11].dz << 16;
        func_800C16A0(pl, dir[i + 11] << 4);
        pl->body->unk_18 = masked_lookup_value(pl->body, form[i + 11].anim, form[i + 11].frame);
    }
    for (i = 0; i < 4; i++) {
        pl = &D_80087138[i];
        pl->body->x += form[i + 22].dx << 16;
        pl->body->y += form[i + 22].dy << 16;
        pl->body->z += form[i + 22].dz << 16;
        func_800C16A0(pl, dir[i + 22] << 4);
        pl->body->unk_18 = masked_lookup_value(pl->body, form[i + 22].anim, form[i + 22].frame);
    }
}
