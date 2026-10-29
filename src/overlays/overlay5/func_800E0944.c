#include "types.h"

s32 func_800E0944(u32 flags) {
    s32 result = 0;

    if (flags & 0x800) {
    } else if (flags & 0x400) {
        result = 1;
    } else if (flags & 0x200) {
        result = 2;
    } else if (flags & 0x100) {
        result = 3;
    } else if (flags & 0x8000) {
        result = 8;
    } else if (flags & 4) {
        result = 0x12;
    } else if (flags & 0x4000) {
        result = 0x11;
    } else if (flags & 2) {
        result = 0x10;
    } else if (flags & 0x1000) {
        result = 0x1C;
    } else if (flags & 0x2020) {
        result = 4;
    } else if (flags & 0x10) {
        result = 5;
    } else if (flags & 8) {
        result = 6;
    } else if (flags & 1) {
        result = 7;
    } else {
        result = 0x19;
    }
    return result;
}
