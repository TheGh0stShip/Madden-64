#include "types.h"

typedef struct {
    u8 pad00[0x1C];
    s32 x;
    s32 y;
} Motion;

typedef struct {
    u8 pad00[0x24];
    Motion *motion;
    u8 pad28[0x3C];
    u8 kind;
    u8 pad65[0x4B];
} Player;

typedef struct {
    u8 player;
    u8 pad01[0xB];
} Formation;

extern Formation D_80069EDE[];
extern s32 D_8007A07C;
extern Motion *D_80086178;
extern Player D_80087138[];
extern Player D_800871E8;

u16 *func_800209AC(void);
s32 func_80093F0C(void);
void func_80034D30(s32, s32, s32);
void func_800C0BBC(Player *, s32);
void func_800E1BAC(Player *, s8 *);
void func_800E1BCC(Player *, s8 *);

void func_800A5FD8(s32 arg0) {
    u16 *play;
    s32 best;
    s32 bestDist;
    s32 i;
    s32 dx;
    s32 dy;
    u8 slot;
    s8 msg;

    play = func_800209AC();
    D_8007A07C = arg0;
    if (func_80093F0C() != 0) {
        func_80034D30(arg0, 2, 0);
    }
    slot = D_80069EDE[*play].player;
    best = -1;
    bestDist = 0x7FFFFFFF;
    if (D_80087138[slot].kind == 0x34) {
        best = slot;
    } else {
        for (i = 0; i < 4; i++) {
            dx = (D_80087138[i].motion->x - D_80086178->x) >> 4;
            if (dx < 0) {
                dx = -dx;
            }
            dy = (D_80087138[i].motion->y - D_80086178->y) >> 4;
            if (dy < 0) {
                dy = -dy;
            }
            if (dx < dy) {
                dy += dx / 2;
            } else {
                dy = dx + dy / 2;
            }
            if (D_80087138[i].kind == 0x34) {
                if (dy < bestDist) {
                    bestDist = dy;
                    best = i;
                }
            }
        }
    }
    msg = 0x39;
    if (best != -1) {
        func_800C0BBC(&D_80087138[best], 0x44);
        func_800E1BCC(&D_80087138[best], &msg);
    } else {
        func_800C0BBC(&D_800871E8, 0x44);
        func_800E1BAC(&D_800871E8, &msg);
    }
}
