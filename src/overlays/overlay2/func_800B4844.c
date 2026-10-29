#include "types.h"

typedef struct {
    u8 pad00[0xD];
    u8 number;
    u8 position;
} Player;

typedef struct {
    u16 *ids;
} Roster;

typedef struct {
    u8 mode;
    u8 pad01[7];
    Roster *roster;
} Pick;

typedef struct {
    u8 pad00[0x60];
    Pick *pick;
} Owner;

typedef struct {
    u16 slot[55];
} Team;

extern char D_8006BFA0[];
extern Team D_80080CFC;

u16 func_8003A1D0(void);
u16 func_800AF1D4(s32);
Player *func_8003AA28(u16);
void func_800167FC(u8, char *);
void func_8002E65C(char *, char *);

void func_800B4844(u16 index, char *dst, Owner *owner) {
    Pick *pick = owner->pick;

    if (pick->mode == 0) {
        if (index < func_8003A1D0()) {
            func_800167FC(func_8003AA28(pick->roster->ids[index])->number, dst);
            return;
        }
        func_8002E65C(dst, D_8006BFA0);
    }
}
