#include "types.h"

/*
 * audio_table_decode_secondary: defensive team rating (0..100) from a 55-player roster.
 *
 * The defensive counterpart of audio_table_decode_primary: each starting slot of a defensive
 * position (10..20) takes the next player listed there, adds a weighted sum of his ratings,
 * with half weight for a position's second-string player where two are counted, and the
 * total is scaled to a percentage.  The catalogue name is kept.
 */

typedef struct RosterPlayer {
    u8 pad_00[0xE];
    u8 position;
    u8 pad_0F[2];
    u8 unk_11;
    u8 unk_12;
    u8 unk_13;
    u8 unk_14;
    u8 pad_15[6];
    u8 unk_1B;
    u8 pad_1C[0xC];
} RosterPlayer;

u16 audio_table_decode_secondary(RosterPlayer *players) {
    u32 total = 0;
    u16 slots[11] = { 1, 1, 2, 1, 1, 1, 1, 1, 2, 2, 1 };
    u32 value;
    u16 i;
    u32 pos;

    for (i = 0; i < 55; i++) {
        pos = (players[i].position & 0x3F) - 10;
        switch (pos) {
            case 0:
            case 1:
                if (slots[pos] != 0) {
                    total += players[i].unk_11 * 2 + players[i].unk_12 + players[i].unk_13 + players[i].unk_1B * 2;
                    slots[pos]--;
                }
                break;
            case 2:
                value = players[i].unk_11 * 2 + players[i].unk_12 + players[i].unk_13 + players[i].unk_1B * 2;
                switch (slots[pos]) {
                    case 2:
                        total += value;
                        slots[pos]--;
                        break;
                    case 1:
                        total += value;
                        slots[pos]--;
                        break;
                }
                break;
            case 7:
            case 10:
                if (slots[pos] != 0) {
                    total += players[i].unk_14 * 2 + players[i].unk_12 + players[i].unk_13 * 2 + players[i].unk_1B;
                    slots[pos]--;
                }
                break;
            case 8:
            case 9:
                value = players[i].unk_14 * 2 + players[i].unk_12 + players[i].unk_13 * 2 + players[i].unk_1B;
                switch (slots[pos]) {
                    case 2:
                        total += value;
                        slots[pos]--;
                        break;
                    case 1:
                        total += value >> 1;
                        slots[pos]--;
                        break;
                }
                break;
            case 3:
            case 4:
            case 5:
            case 6:
                if (slots[pos] != 0) {
                    total += (players[i].unk_13 * 3 >> 1) + (players[i].unk_14 >> 1) + players[i].unk_13 * 2 +
                             players[i].unk_1B * 2;
                    slots[pos]--;
                }
                break;
        }
    }
    total = total * 100 / 253;
    total = total / 78 * 2 - 35;
    if (total > 100) {
        total = 100;
    }
    return total;
}
