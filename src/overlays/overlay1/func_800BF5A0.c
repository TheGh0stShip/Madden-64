#include "types.h"

typedef struct {
    s32 masks[5];
} ButtonMap;

typedef struct {
    u8 pad00[0x21];
    u8 slot;
    u8 pad22[6];
    u16 flags;
} Player;

extern ButtonMap *D_80072720[];
extern s32 D_800726D8[];
extern s32 D_80080C10;
extern s32 D_80080C1C;
extern s16 D_80085024;
extern s8 D_800879A4[];
extern s8 D_80087FE4[];
extern s8 D_8008B2A8[];

void func_800A365C(s32);
void func_800BB7E4(Player *);
void func_800BBB18(Player *);
void func_800BC5C8(void);
s32 func_800BD694(Player *);
void func_800BD6CC(Player *);
void func_800BD6F8(Player *, s8);
void func_800C93D8(Player *);
void func_800C9418(Player *);
void func_800C945C(Player *);

s32 func_800BF5A0(Player *player) {
    ButtonMap *map;
    s32 buttons;
    s16 i;

    if (D_80080C10 & 0x01000000) {
        player->flags &= 0xFFFE;
        return 0;
    }
    map = D_80072720[D_8008B2A8[player->slot & 0xBF]];
    func_800BD6CC(player);
    buttons = func_800BD694(player);
    if (player->flags & 0x10) {
        return 0;
    }
    func_800BBB18(player);
    if (D_80080C10 & 0x10) {
        if (D_80080C1C == 0) {
            if (buttons & 2) {
                func_800BD6F8(player, -1);
                return 1;
            }
            for (i = 0; i < D_80085024; i++) {
                if ((buttons & D_800726D8[i]) && D_80087FE4[i] != 0) {
                    D_80080C1C |= D_800726D8[i];
                    func_800BD6F8(player, D_800879A4[i]);
                }
            }
        }
        return 0;
    }
    if (buttons & map->masks[2]) {
        func_800BC5C8();
        func_800A365C(2);
    } else if (buttons & map->masks[0]) {
        func_800C9418(player);
    } else if (buttons & map->masks[1]) {
        func_800C93D8(player);
    } else if (buttons & map->masks[3]) {
        func_800C945C(player);
    } else if (buttons & map->masks[4]) {
        func_800BB7E4(player);
    }
    return 0;
}
