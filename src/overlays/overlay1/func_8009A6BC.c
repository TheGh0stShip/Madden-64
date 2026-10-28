#include "types.h"

typedef struct Actor Actor;

typedef struct {
    u8 pad00[0x12];
    u16 heading;
} Body;

struct Actor {
    u8 pad00[8];
    Body *body;
    u8 pad0C[6];
    s16 heading;
    s32 flags14;
    u8 pad18[4];
    s32 x;
    s32 y;
    u8 pad24[0x30];
    u16 kind;
    u8 pad56[0x12];
    u16 flags68;
    u8 pad6A[0xA];
    Actor *link;
};

extern s32 D_80078450;
extern s32 D_80078454;
extern s32 D_8009603C;

void func_80008F30(s32, s32 *, Actor *, s32);

void func_8009A6BC(Actor *actor, s32 arg1) {
    Actor *target = (Actor *)actor->body;
    Actor *link;

    if ((target->flags68 & 8) && (link = target->link) != 0) {
        if (!(link->flags14 & 1)) {
            return;
        }
        actor->x = link->x;
        actor->y = link->y;
        if (link->kind == 6) {
            target->heading = -link->body->heading;
        } else if (link->kind == 7) {
            target->heading = -link->body->heading;
        }
    }
    D_80078454 = 0;
    D_80078450 = 0;
    func_80008F30(arg1, &D_8009603C, actor, 0xF4);
}
