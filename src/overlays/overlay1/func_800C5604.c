/* recipe: --symbol=func_800B9208:0x800B9208 --symbol=func_800B9274:0x800B9274 --symbol=func_800C157C:0x800C157C (real-address callee names) */
#include "types.h"

typedef struct {
    u8 pad00[0x20];
    s32 y;
    u8 pad24[8];
    s32 vel[2];
} Body;

typedef struct Player {
    u8 pad00[0x13];
    u8 rating;
    u8 pad14[0xB];
    u8 active;
    u8 pad20[4];
    Body *body;
    u16 flags;
    u8 pad2A[0xE];
    struct Player *target;
    u8 pad3C[0x12];
    s16 hit;
    u8 pad50[0x14];
    u8 kind;
} Player;

extern s32 D_80080C10;
extern Body *D_80086178;
extern Player *D_8008A058;

s32 func_8001FA38(s32);
void func_8001FA68(s32, Player *, s32, s32);
u16 func_80031A1C(u16);
void func_8003EE10(Player *);
s32 func_800B9208(s32 *);
void func_800B9274(s16, s32 *, s32);
s32 func_800C157C(Player *);
void func_800E1BCC(Player *, u8 *);

/* Resolves a pending hit: knocks the player back, emits event 0x1A, and may roll fumble/injury checks on the tackled target. */
s32 func_800C5604(Player *player) {
    u8 event;
    s32 angle;

    if (player->hit == 1) {
        player->hit = 0;
        if (player->body->vel[0] | player->body->vel[1]) {
            angle = (s16)func_800B9208(player->body->vel);
        } else {
            angle = ((s16)func_800C157C(player) + 0x7FF) & 0xFFF;
        }
        func_800B9274(angle, player->body->vel, 0x1800);
        event = 0x1A;
        func_800E1BCC(player, &event);
        if (func_80031A1C(2) == 0) {
            func_8003EE10(player);
        }
        if (!(player->flags & 8) && player->target->active != 0 && player->target != D_8008A058 && !(D_80080C10 & 9)) {
            if (player->target->kind == 0x10 || player->target->kind == 0x1B || player->target->kind == 0x11) {
                if (D_80080C10 & 0x100) {
                    angle = ((s16)func_800C157C(player) - (s16)func_800C157C(player->target)) & 0xFFF;
                    if (angle > 0x800) {
                        angle = 0xFFF - angle;
                    }
                    if (angle < 0x4E3) {
                        if (func_80031A1C(0x40 - (player->target->rating >> 2)) > func_80031A1C((0xE - (s16)func_8001FA38(8)) * 12)) {
                            func_8001FA68(8, player->target, player->body->y, D_80086178->y);
                        }
                    }
                }
                if (func_80031A1C(0x40 - (player->target->rating >> 2)) > func_80031A1C((0x10 - (s16)func_8001FA38(6)) * 20)) {
                    func_8001FA68(6, player->target, player->body->y, D_80086178->y);
                }
            }
        }
        return 1;
    }
    return 0;
}
