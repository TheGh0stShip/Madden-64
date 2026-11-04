#include "types.h"

void func_80037C2C(u8 *entry) {
    register u8 value;
    u32 narrow;
    s32 result;
    s32 raw;

    switch (entry[0]) {
    case 0x0A:
        result = entry[2];
        result -= 0x80;
        result = -result;
        entry[2] = result & 0x7F;
        break;

    case 0x2D:
        entry[1] = 6 - entry[1];
        value = entry[2];
        if (value == 0) {
            entry[2] = 1;
        } else if (value == 1) {
            entry[2] = 0;
        } else if (value < 0x14) {
            entry[2] = value + 10;
        } else {
            entry[2] = value - 10;
        }
        break;

    case 0x2C:
        do {
            entry[1] = 6 - entry[1];
            entry[2] = 0x1A - entry[2];
        } while (0);
        break;

    case 0x16:
        result = entry[2];
        result = result - 0x80;
        entry[2] = (-result) & 0x7F;
        break;

    case 0x19:
        if (entry[1] != 0) {
            entry[1] = 6 - entry[1];
        }
        break;

    case 0x2B:
        raw = entry[2];
        narrow = raw;
        narrow &= 0xFF;
        if (narrow < 2) {
            entry[2] = 1 - raw;
        } else if (narrow < 5) {
            entry[2] = 6 - raw;
        } else {
            entry[2] = 13 - raw;
        }
        break;
    }
}
