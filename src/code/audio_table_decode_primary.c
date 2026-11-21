#include "types.h"

typedef struct {
    u8 pad_00[0xE];
    u8 position;
    u8 pad_0F[2];
    u8 unk_11;
    u8 unk_12;
    u8 unk_13;
    u8 unk_14;
    u8 unk_15;
    u8 unk_16;
    u8 unk_17;
    u8 pad_18[2];
    u8 unk_1A;
    u8 pad_1B[2];
    u8 unk_1D;
    u8 unk_1E;
    u8 pad_1F[9];
} RosterPlayer;

u16 audio_table_decode_primary(RosterPlayer *players) {
    u32 total = 0;
    u16 slots[10] = { 1, 2, 1, 4, 2, 1, 1, 1, 1, 1 };
    u32 value;
    u16 i;
    u32 pos;

    for (i = 0; i < 55; i++) {
        pos = players[i].position & 0x3F;
        switch (pos) {
            case 0:
                if (slots[pos] != 0) {
                    total += (players[i].unk_16 + players[i].unk_17) * 2 + players[i].unk_12 + players[i].unk_13;
                    slots[pos]--;
                }
                break;
            case 1:
                value = players[i].unk_11 + players[i].unk_12 + players[i].unk_14 + players[i].unk_15 + players[i].unk_13 + players[i].unk_1A;
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
            case 2:
                if (slots[pos] != 0) {
                    total += players[i].unk_1A * 2 + players[i].unk_15 + players[i].unk_12 + players[i].unk_1D + players[i].unk_1E;
                    slots[pos]--;
                }
                break;
            case 3:
                value = (players[i].unk_13 + players[i].unk_12 + players[i].unk_14) * 2 + players[i].unk_1A;
                switch (slots[pos]) {
                    case 4:
                        total += value;
                        slots[pos]--;
                        break;
                    case 3:
                        total += value;
                        slots[pos]--;
                        break;
                    case 2:
                        total += value * 3 >> 2;
                        slots[pos]--;
                        break;
                    case 1:
                        total += value >> 1;
                        slots[pos]--;
                        break;
                }
                break;
            case 4:
                value = players[i].unk_12 + players[i].unk_1E * 2 + players[i].unk_14 * 3;
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
            case 5:
            case 6:
            case 7:
            case 8:
            case 9:
                if (slots[pos] != 0) {
                    total += (players[i].unk_11 + players[i].unk_13 + players[i].unk_1D * 2 + players[i].unk_1E * 2) >> 1;
                    slots[pos]--;
                }
                break;
        }
    }
    total = total * 100 / 16192 * 2 - 40;
    if (total > 100) {
        total = 100;
    }
    return total;
}
