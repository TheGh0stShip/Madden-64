#include "types.h"
typedef struct { u8 pad00[2]; u8 a; u8 b; u8 state; } Slot;
extern s8 D_800C4AD2;
extern s8 D_800C4AD3;
extern s8 D_80072038[];
extern s8 D_80072040[];
extern s16 D_800876DC;
extern u16 D_80082D94;
extern u16 D_80084EE0;
void func_80024EDC(s32);
Slot *func_8009D69C(s32, s32);
void func_8009CDAC(void);

void func_8009DB14(void) {
    Slot *slot = 0;
    s32 i, found;
    s32 team;
    s32 count;

    func_80024EDC(4);
    team = D_800C4AD3;
    if (D_800C4AD2 == 4) {
        count = D_80072038[team];
    } else {
        count = D_80072040[team];
    }
    for (i = 0; i < count; i++) {
        slot = func_8009D69C(team, i);
        if (slot->state == 1) {
            break;
        }
    }
    if (D_800876DC != 7) {
        slot->state = 8;
        slot->a = D_80082D94;
        slot->b = D_80084EE0;
    } else {
        slot->state = 0;
    }
    found = -1;
    for (i = 0; i < count; i++) {
        if (func_8009D69C(team, i)->state != 8) {
            found = i;
            break;
        }
    }
    if (found == -1) {
        func_8009CDAC();
    }
}
