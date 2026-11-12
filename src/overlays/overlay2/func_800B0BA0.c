#include "types.h"

typedef struct {
    u8 pad0[0xD];
    u8 number;
    u8 position;
} Player;

typedef struct {
    u16 slot[55];
} TeamSlots;

extern TeamSlots D_80080CFC;
extern u8 D_80080D6A[];
extern char *D_800E6B78[];

Player *func_8003AA28(u16);
void func_800167FC(s16, char *);
void func_8002E65C(char *, char *);
u16 func_80024B90(u16);
u8 *func_8003A7B8(u8);
void func_800AFA50(u8 *, u16, char *, u16);
char *strcpy(char *, const char *);

void func_800B0BA0(s32 index, s32 field, char *buf) {
    u16 *base = D_80080CFC.slot;
    u16 *slot = (u16 *)((u32)base + (index << 1));
    Player *player;
    u8 team;
    u8 n;

    if (*slot != 0xFFFF) {
        player = func_8003AA28(*slot);
        if (field == 1) goto c1;
        if (field == 0) goto c0;
        if (field == 2) goto c2;
        if (field == 3) goto c3;
        goto def;
c0:
        func_800167FC(player->number, buf);
        return;
c2:
        func_8002E65C(buf, D_800E6B78[player->position & 0x3F]);
        return;
c1:
        func_8002E65C(buf, (char *)player);
        return;
c3:
        team = func_80024B90(*slot);
        if (team != 0xFF) {
            func_8002E65C(buf, (char *)func_8003A7B8(team) + 0x55);
        } else {
            strcpy(buf, "(FA)");
        }
        return;
def:
        n = field - 4;
        if (n != 0 && n < 0x11) {
            func_800AFA50(D_80080D6A, index, buf, n + 1);
        } else {
            func_800AFA50(D_80080D6A, index, buf, n);
        }
    } else if (index == 0 && field == 1) {
        strcpy(buf, "NO CREATED PLAYERS");
    }
}
