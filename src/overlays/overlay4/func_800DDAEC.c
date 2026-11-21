#include "types.h"

typedef struct {
    u8 id;
    u8 a;
    u8 b;
    u8 c;
} Slot;

typedef struct {
    u8 pad00[0x64];
    Slot slots[20];
} Player;

typedef struct {
    u8 *ctrl;
    u8 pad04[0x214C - 4];
} TeamCtrl;

extern TeamCtrl D_80082DBC[];
extern Player *D_80085040[][22];
extern s32 D_80087A70;
extern s8 D_80087A82;
extern u16 D_8008A5B2;

void func_800DC21C(Slot *slot);

void func_800DC24C(s32 team) {
    Player **players;
    Player **pp;
    Player *p;
    Slot *s;
    s32 i, a, b, k1, k2;
    Slot tmp;

    if ((*D_80082DBC[team].ctrl & 0x60) != 0x60) {
        D_80087A82 = 2;
    } else if (D_8008A5B2 == 5) {
        if (D_80087A70 > 0) {
            D_80087A82 = 1;
        } else {
            D_80087A82 = 2;
        }
    } else if (D_80087A70 > 0) {
        D_80087A82 = 2;
    } else {
        D_80087A82 = 1;
    }
    players = D_80085040[team];
    if (D_80087A82 == 1) {
        for (i = 0; i < 10;) {
            a = i++;
            b = i++;
            p = players[a];
            s = (Slot *)p;
            k1 = 0;
            do {
                if (s[25].id == 0) {
                    s = (Slot *)p + 10;
                    k1 = 10;
                }
                if (s[25].id == 0x24) {
                    break;
                }
                k1++;
                s++;
            } while (k1 < 10);
            pp = (Player **)(b * 4 + (u32)players);
            p = *pp;
            s = (Slot *)p;
            k2 = 0;
            do {
                if (s[25].id == 0) {
                    s = (Slot *)p + 10;
                    k2 = 10;
                }
                if (s[25].id == 0x24) {
                    break;
                }
                k2++;
                s++;
            } while (k2 < 10);
            if ((k1 != 10) & (k2 != 10)) {
                tmp.a = players[a]->slots[k1].a;
                tmp.b = players[a]->slots[k1].b;
                tmp.c = players[a]->slots[k1].c;
                players[a]->slots[k1].a = (*pp)->slots[k2].a;
                players[a]->slots[k1].b = (*pp)->slots[k2].b;
                players[a]->slots[k1].c = (*pp)->slots[k2].c;
                (*pp)->slots[k2].a = tmp.a;
                (*pp)->slots[k2].b = tmp.b;
                (*pp)->slots[k2].c = tmp.c;
            }
            if (k1 != 10) {
                func_800DC21C(&players[a]->slots[k1]);
            }
            if (k2 != 10) {
                func_800DC21C(&(*pp)->slots[k2]);
            }
        }
    }
}
