#include "types.h"

typedef struct {
    u8 pad00[0xE];
    u8 position;
    u8 pad0F[0x19];
} Player;

typedef struct {
    u16 slot[55];
    Player players[55];
    u8 pad[0x214C - 0x6E - 55 * 0x28];
} Team;

extern Team D_80080CFC[];

void func_80033308(s32, u8 *, s32, s32);

/* Counts the rostered players of a team by position (counts[25] cleared first). */
void func_800BD6D0(s32 team, u8 *counts) {
    s32 i;

    func_80033308(0, counts, 0x19, 0);
    i = 54;
    do {
        if (D_80080CFC[team].slot[i] != 0xFFFF) {
            counts[D_80080CFC[team].players[i].position & 0x3F]++;
        }
    } while (i-- != 0);
}
