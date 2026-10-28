#include "types.h"

typedef struct {
    u8 pad00[0x18];
    s32 anim;
    s32 x;
    s32 y;
    s32 z;
} Node;

typedef struct {
    u8 pad00[0x24];
    Node *node;
    u8 pad28[0xB0 - 0x28];
} Marker;

typedef struct {
    u8 pad00[0x24];
    Node *node;
} Player;

typedef struct {
    Player *members[22];
} Group;

/* One formation spot: x in bits 31..20, y in bits 19..8, z in byte 3; animation in bits 31..20 of
 * the second word with its frame in the low halfword. */
typedef struct {
    s32 pos;
    u32 anim;
} Spot;

typedef struct {
    Spot offense[11];
    Spot defense[11];
    Spot markers[4];
    u8 pad[0xF0 - 26 * 8];
} Formation;

typedef struct {
    u8 offense[11];
    u8 defense[11];
    u8 markers[4];
    u8 pad[4];
} FormationFacing;

extern u8 *D_800718E8;
extern Group D_80085040[2];
extern Marker D_80087138[4];

void func_800C16A0(void *actor, s32 facing);
s32 func_800B4988(Node *node, u32 anim, u16 frame);

void func_800B9B80(u16 formation) {
    Formation *form;
    FormationFacing *facing;
    Player *player;
    u16 i;

    form = (Formation *)(D_800718E8 + 0x2540) + formation;
    facing = (FormationFacing *)(D_800718E8 + 0x15D70) + formation;
    for (i = 0; i < 11; i++) {
        player = D_80085040[0].members[i];
        player->node->x = ((i + form->offense)[0].pos >> 20) << 16;
        player->node->y = (((i + form->offense)[0].pos << 12) >> 20) << 16;
        player->node->z = ((s8 *)&(i + form->offense)[0])[3] << 16;
        func_800C16A0(player, (i + facing->offense)[0] << 4);
        player->node->anim = (u16)func_800B4988(player->node, (i + form->offense)[0].anim >> 20, ((u16 *)&(i + form->offense)[0])[3]);
    }
    for (i = 0; i < 11; i++) {
        player = D_80085040[1].members[i];
        player->node->x = ((i + form->defense)[0].pos >> 20) << 16;
        player->node->y = (((i + form->defense)[0].pos << 12) >> 20) << 16;
        player->node->z = ((s8 *)&(i + form->defense)[0])[3] << 16;
        func_800C16A0(player, (i + facing->defense)[0] << 4);
        player->node->anim = (u16)func_800B4988(player->node, (i + form->defense)[0].anim >> 20, ((u16 *)&(i + form->defense)[0])[3]);
    }
    for (i = 0; i < 4; i++) {
        player = (Player *)&D_80087138[i];
        player->node->x = ((i + form->markers)[0].pos >> 20) << 16;
        player->node->y = (((i + form->markers)[0].pos << 12) >> 20) << 16;
        player->node->z = ((s8 *)&(i + form->markers)[0])[3] << 16;
        func_800C16A0(player, (i + facing->markers)[0] << 4);
        player->node->anim = (u16)func_800B4988(player->node, (i + form->markers)[0].anim >> 20, ((u16 *)&(i + form->markers)[0])[3]);
    }
}
