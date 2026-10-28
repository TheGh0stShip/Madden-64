#include "types.h"

typedef struct {
    u8 pad00[0x12];
    u16 heading;
} Body;

typedef struct {
    u8 pad00[8];
    Body *body;
    u8 pad0C[0x48];
    u16 kind;
} Actor;

typedef struct {
    u8 pad00[0x24];
    Actor *actor;
} Player;

typedef struct {
    s32 unk00;
    u16 angle;
    u16 unk06;
} Facing;

extern s32 D_80088090;

void func_8000EC6C(Actor *, Facing *);
s32 func_8000C8EC(s32);

u16 func_800C5CA0(Player *player) {
    Actor *actor = player->actor;
    Facing facing;

    if (actor->kind == 6) {
        return actor->body->heading & 0xFFF;
    } else if (actor->kind == 7) {
        return actor->body->heading & 0xFFF;
    } else if (actor->kind == 8) {
        func_8000EC6C(actor, &facing);
        if (func_8000C8EC(D_80088090) != 0) {
            return (facing.angle + 0xC00) & 0xFFF;
        }
        return (facing.angle + 0x400) & 0xFFF;
    }
    return 0;
}
