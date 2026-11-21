#include "types.h"

typedef struct {
    u8 unk_00[0xE];
    u8 position;
    u8 ratings[0x19];
} Player;

typedef struct {
    u16 roster[55];
    Player players[210];
    u8 unk_213E[0xE];
} Team;

extern Team D_80080CFC[];
extern u8 *D_8006AA58[];
extern u8 D_8006AABC[];
s16 team_slot_available_test(s16 team, s16 slot);
s16 roster_attribute_find(u16 team, u16 slot, u16 attribute);

s32 gameplay_record_process(team, position, exclude)
    s32 team;
    u16 position;
    u16 exclude;
{
    Player *players;
    u8 *alt;
    u16 i;
    u16 count;
    u16 total;
    u16 attribute;
    u16 rating;
    u16 bestSlot;
    u8 best;
    u16 id;

    count = 0;
    players = D_80080CFC[(u16)team].players;
    for (i = 0; i < 55; i++) {
        if (D_80080CFC[(u16)team].roster[i] == exclude) {
            break;
        }
        if (position == (players[i].position & 0x3F)) {
            count++;
        }
    }
    total = count;
    count = 0;
    attribute = (position >= 10) ? 3 : 0;
    for (i = 0; i < 55; i++) {
        id = D_80080CFC[(u16)team].roster[i];
        if (id == 0xFFFF) {
            continue;
        }
        if (id == exclude) {
            continue;
        }
        if (position != (players[i].position & 0x3F)) {
            continue;
        }
        count++;
        if (count > total && team_slot_available_test(team, i)
            && roster_attribute_find(team, i, attribute) == -1) {
            return i;
        }
    }
    alt = D_8006AA58[position];
    while (*alt != 0xFF) {
        for (i = 0; i < 55; i++) {
            id = D_80080CFC[(u16)team].roster[i];
            if (id == 0xFFFF) {
                continue;
            }
            if (id == exclude) {
                continue;
            }
            if (*alt != (players[i].position & 0x3F)) {
                continue;
            }
            count++;
            if (count > total && team_slot_available_test(team, i)
                && roster_attribute_find(team, i, attribute) == -1) {
                return i;
            }
        }
        alt++;
    }
    rating = D_8006AABC[position];
    best = 0;
    bestSlot = 0;
    for (i = 0; i < 55; i++) {
        id = D_80080CFC[(u16)team].roster[i];
        if (id == 0xFFFF) {
            continue;
        }
        if (id == exclude) {
            continue;
        }
        alt = players[i].ratings;
        if (team_slot_available_test(team, i) && roster_attribute_find(team, i, attribute) == -1) {
            if (best < alt[rating]) {
                best = alt[rating];
                bestSlot = i;
            }
        }
    }
    return bestSlot;
}
