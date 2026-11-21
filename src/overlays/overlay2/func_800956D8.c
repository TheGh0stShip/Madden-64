#include "types.h"

typedef struct {
    u8 position;
    u8 pad01[0x28 - 0x1];
} Player;

typedef struct {
    u16 slots[0x37];
    u8 roster[0xE];
    Player players[0x37];
    u8 pad914[0x20E0 - 0x914];
    u8 id;
    u8 pad20E1[0x214C - 0x20E1];
} Team;

extern Team D_80080CFC[2];
extern u8 D_800C3990;
u16 func_800D20A0(u8 *, u16, u16);

u8 func_800956D8(s32 id) {
    s32 total = 0;
    s32 count = 0;
    s32 i;
    s32 team = id == D_80080CFC[0].id;

    for (i = 0; i < 0x37; i++) {
        if (D_80080CFC[team].slots[i] != 0xFFFF) {
            switch (D_80080CFC[team].players[i].position) {
                case 0:
                    total += func_800D20A0(D_80080CFC[team].roster, i, 0xFF) * 2;
                    count += 2;
                    break;
                case 1:
                case 3:
                case 4:
                    total += func_800D20A0(D_80080CFC[team].roster, i, 0xFF);
                    count += 1;
                    break;
            }
            if (count >= 6) {
                break;
            }
        }
    }
    if (total / count >= 300) {
        return D_800C3990;
    }
    return 0;
}
