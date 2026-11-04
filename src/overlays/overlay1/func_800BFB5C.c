#include "types.h"

typedef struct {
    s32 masks[5];
} ButtonMap;

typedef struct {
    u8 pad00[0x20];
    s32 z;
} Body;

typedef struct {
    s8 type;
    s8 value;
    u8 pad02[6];
} Command;

typedef struct {
    u8 pad00[0x21];
    u8 slot;
    u8 pad22[2];
    Body *body;
    u16 flags;
} Player;

extern ButtonMap *D_80072720[];
extern s32 D_80080C10;
extern Body *D_80086178;
extern s16 D_80089320;
extern s8 D_8008B2A8[];

s16 func_800BBB18(Player *);
s32 func_800BD694(Player *);
void func_800BD734(s32);
u32 func_800C157C(Player *);
void func_800C9418(Player *);
void func_800C9778(Player *, s32);
void func_800E1BCC(Player *, Command *);

s32 func_800BFB5C(Player *player) {
    Command throw_cmd;
    Command pitch_cmd;
    ButtonMap *map;
    s32 buttons;
    s32 slot;
    u32 command_value;

    if (D_80080C10 & 0x01000000) {
        player->flags &= 0xFFFE;
        return 0;
    }

    buttons = func_800BD694(player);
    slot = player->slot & 0xBF;
    map = D_80072720[D_8008B2A8[slot]];
    if (buttons & map->masks[2]) {
        func_800BD734(slot);
        return 0;
    }

    if ((D_80080C10 & 0x4000) || D_80089320 != -1) {
        if (!(player->flags & 0x10) &&
            ((buttons != 0) | (~func_800BBB18(player) != 0)) &&
            player->body->z - D_80086178->z <= 0xBFFFFF) {
            if (buttons & map->masks[0]) {
                func_800C9418(player);
            } else if (buttons & map->masks[3]) {
                func_800C9778(player, 1);
            } else if (buttons & map->masks[1]) {
                throw_cmd.type = 0x1F;
                command_value = func_800C157C(player);
                command_value >>= 4;
                throw_cmd.value = command_value;
                func_800E1BCC(player, &throw_cmd);
            } else if (buttons & map->masks[4]) {
                pitch_cmd.type = 0x30;
                command_value = func_800C157C(player);
                command_value >>= 4;
                pitch_cmd.value = command_value;
                func_800E1BCC(player, &pitch_cmd);
            }
        }
    }
    return 0;
}
