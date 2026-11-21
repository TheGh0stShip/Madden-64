#include "types.h"

typedef struct {
    u8 unk00[0xE];
    u8 position;
    u8 ratings[0x19];
} RosterPlayer;

u16 overlay5_byte_at_u16_offset(u8 *ratings, u16 index);

u16 func_800D20A0(RosterPlayer *players, u16 index, u16 attribute) {
    u8 *ratings;
    u16 overall;

    ratings = players[index].ratings;
    if (attribute == 0xFF) {
        switch (players->position & 0x3F) {
        case 0:
            overall = overlay5_byte_at_u16_offset(ratings, 2);
            overall += overlay5_byte_at_u16_offset(ratings, 3);
            overall += overlay5_byte_at_u16_offset(ratings, 7) * 2;
            overall += overlay5_byte_at_u16_offset(ratings, 8) * 2;
            overall += overlay5_byte_at_u16_offset(ratings, 4);
            overall += overlay5_byte_at_u16_offset(ratings, 0xB);
            overall /= 8;
            overall += overlay5_byte_at_u16_offset(ratings, 0xD);
            return overall;
        case 1:
            overall = overlay5_byte_at_u16_offset(ratings, 2);
            overall += overlay5_byte_at_u16_offset(ratings, 3);
            overall += overlay5_byte_at_u16_offset(ratings, 5);
            overall += overlay5_byte_at_u16_offset(ratings, 6);
            overall += overlay5_byte_at_u16_offset(ratings, 4);
            overall += overlay5_byte_at_u16_offset(ratings, 0xB);
            overall /= 6;
            overall += overlay5_byte_at_u16_offset(ratings, 0xD);
            return overall;
        case 2:
            overall = overlay5_byte_at_u16_offset(ratings, 2);
            overall += overlay5_byte_at_u16_offset(ratings, 3);
            overall += overlay5_byte_at_u16_offset(ratings, 5);
            overall += overlay5_byte_at_u16_offset(ratings, 6);
            overall += overlay5_byte_at_u16_offset(ratings, 4);
            overall += overlay5_byte_at_u16_offset(ratings, 0xE) * 2;
            overall += overlay5_byte_at_u16_offset(ratings, 0xF) * 2;
            overall += overlay5_byte_at_u16_offset(ratings, 0xB);
            overall /= 8;
            overall += overlay5_byte_at_u16_offset(ratings, 0xD);
            return overall;
        case 5:
        case 6:
        case 7:
        case 8:
        case 9:
            overall = overlay5_byte_at_u16_offset(ratings, 2);
            overall += overlay5_byte_at_u16_offset(ratings, 3);
            overall += overlay5_byte_at_u16_offset(ratings, 4);
            overall += overlay5_byte_at_u16_offset(ratings, 0xE) * 2;
            overall += overlay5_byte_at_u16_offset(ratings, 0xF) * 2;
            overall /= 7;
            overall += overlay5_byte_at_u16_offset(ratings, 0xD);
            return overall;
        case 10:
        case 11:
        case 12:
            overall = overlay5_byte_at_u16_offset(ratings, 2);
            overall += overlay5_byte_at_u16_offset(ratings, 3);
            overall += overlay5_byte_at_u16_offset(ratings, 5);
            overall += overlay5_byte_at_u16_offset(ratings, 4) * 2;
            overall += overlay5_byte_at_u16_offset(ratings, 0xC) * 2;
            overall /= 7;
            overall += overlay5_byte_at_u16_offset(ratings, 0xD);
            return overall;
        case 17:
        case 18:
        case 19:
        case 20:
            overall = overlay5_byte_at_u16_offset(ratings, 2);
            overall += overlay5_byte_at_u16_offset(ratings, 3);
            overall += overlay5_byte_at_u16_offset(ratings, 5) * 2;
            overall += overlay5_byte_at_u16_offset(ratings, 4) * 2;
            overall += overlay5_byte_at_u16_offset(ratings, 0xC);
            overall /= 7;
            overall += overlay5_byte_at_u16_offset(ratings, 0xD);
            return overall;
        case 21:
        case 22:
            overall = overlay5_byte_at_u16_offset(ratings, 9);
            overall += overlay5_byte_at_u16_offset(ratings, 0xA);
            overall /= 2;
            overall += overlay5_byte_at_u16_offset(ratings, 0xD);
            return overall;
        case 3:
            overall = overlay5_byte_at_u16_offset(ratings, 2);
            overall += overlay5_byte_at_u16_offset(ratings, 3);
            overall += overlay5_byte_at_u16_offset(ratings, 5) * 2;
            overall += overlay5_byte_at_u16_offset(ratings, 4);
            overall += overlay5_byte_at_u16_offset(ratings, 0xB);
            overall /= 6;
            overall += overlay5_byte_at_u16_offset(ratings, 0xD);
            return overall;
        case 4:
            overall = overlay5_byte_at_u16_offset(ratings, 2);
            overall += overlay5_byte_at_u16_offset(ratings, 3);
            overall += overlay5_byte_at_u16_offset(ratings, 5) * 2;
            overall += overlay5_byte_at_u16_offset(ratings, 4);
            overall += overlay5_byte_at_u16_offset(ratings, 0xF) * 2;
            overall /= 7;
            overall += overlay5_byte_at_u16_offset(ratings, 0xD);
            return overall;
        case 13:
        case 14:
        case 15:
        case 16:
            overall = overlay5_byte_at_u16_offset(ratings, 2);
            overall += overlay5_byte_at_u16_offset(ratings, 3);
            overall += overlay5_byte_at_u16_offset(ratings, 5);
            overall += overlay5_byte_at_u16_offset(ratings, 4) * 2;
            overall += overlay5_byte_at_u16_offset(ratings, 0xC) * 2;
            overall /= 7;
            overall += overlay5_byte_at_u16_offset(ratings, 0xD);
            return overall;
        default:
            goto single;
        }
    } else {
    single:
        overall = ratings[attribute];
        if (attribute == 0) {
            overall += 0x91;
        }
    }
    return overall;
}
