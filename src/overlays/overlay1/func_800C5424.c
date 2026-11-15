#include "types.h"

typedef struct {
    u8 pad00[0x14];
    u16 frame;
} Body;

typedef struct {
    u8 pad00[8];
    Body *body;
    u8 pad0C[8];
    s32 flags;
} Actor;

typedef struct {
    u8 pad00[0x24];
    Actor *actor;
    u8 pad28[4];
    s32 animation;
} Player;

u16 func_800352D8(Actor *, s32, s32);

u16 func_800C5424(Player *player, s32 anim) {
    u16 result = 0;
    u16 frame;

    if (!(player->actor->flags & 0x10000)) {
        result = func_800352D8(player->actor, anim, 0);
        switch (result) {
            case 0:
            case 1:
            case 3:
                result = 0;
                break;
            case 2:
                player->actor->flags &= 0xFFC3FFFF;
                frame = player->actor->body->frame;
                result = 1;
                player->animation = (anim << 16) | (frame & 0xFF00) | (frame & 0xFF);
                break;
        }
    }
    return result;
}
