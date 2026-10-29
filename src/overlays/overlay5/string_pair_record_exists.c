#include "types.h"

extern u8 *D_80085018;
extern u32 D_800895B4;

s32 func_8002E628(u8 *left, u8 *right);

s32 overlay5_string_pair_record_exists(u8 *first, u8 *second) {
    u8 *record;
    s32 offset;
    u32 index;

    if (D_80085018 == 0) {
        return 0;
    }
    index = 0;
    if (index >= D_800895B4) {
        goto not_found;
    }
    record = D_80085018;
    offset = 0;
    do {
        if (func_8002E628(record + 0x1A, first) == 0) {
            if (func_8002E628(D_80085018 + offset + 0x2B, second) == 0) {
                return 1;
            }
        }
        record += 0x50;
        index++;
        offset += 0x50;
    } while (index < D_800895B4);
not_found:
    return 0;
}
