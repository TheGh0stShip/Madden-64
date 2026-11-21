#include "types.h"

typedef struct {
    u8 unk00[0xE];
    u8 position;
    u8 unk0F[0x28 - 0xF];
} Player;

typedef struct {
    u16 slot[55];
    Player players[55];
    u8 pad906[0x20E0 - 0x906];
    u8 id;
    u8 pad20E1[0x214C - 0x20E1];
} Roster;

extern Roster D_80080CFC[2];
extern u8 D_800C39C8;
s16 func_8003FC94(s16, s16);

u8 func_80095D84(s32 id) {
    s32 home = id == D_80080CFC[0].id;
    s32 found[2];
    s32 count = 0;
    s32 i;

    for (i = 0; i < 55; i++) {
        if (D_80080CFC[home].slot[i] != 0xFFFF && D_80080CFC[home].players[i].position == 3) {
            found[count] = i;
            count++;
            if (count == 2) {
                break;
            }
        }
    }
    if (i != 55 && (func_8003FC94(home, found[0]) == 0 || func_8003FC94(home, found[1]) == 0)) {
        return D_800C39C8;
    }
    return 0;
}
