#include "types.h"

typedef struct {
    s8 type;
} Message;

typedef struct {
    u8 unk00[0x14];
    s32 flags;
} ActorInfo;

typedef struct {
    u8 unk00[0x24];
    ActorInfo *info;
    u16 flags;
} Actor;

extern Actor *D_80085040[][22];
extern s16 D_800886E0;
extern u16 D_8008B672;

void func_800E1A84(Actor *, Message *);
void func_800E1BAC(Actor *, Message *);

void func_800C5E68(void) {
    Message msg;
    s16 i;
    Actor *actor;

    for (i = 0; i < D_8008B672 >> 1; i++) {
        actor = D_80085040[D_800886E0][i];
        msg.type = 0x12;
        if ((actor->flags & 0x10) || (actor->info->flags & 0x10000)) {
            func_800E1BAC(actor, &msg);
        } else {
            func_800E1A84(actor, &msg);
        }
    }
}
