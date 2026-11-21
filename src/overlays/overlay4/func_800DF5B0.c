#include "types.h"

typedef struct {
    u8 id;
    u8 pad01[0x214B];
} TeamInfo;

extern u8 **D_8007A178;
extern TeamInfo D_80080C90[];
extern s16 D_800885D2;
extern s16 D_800886E0;
extern s16 D_80088AE4;

s32 func_800DF5B0(s16 arg0, s16 arg1) {
    s16 home;
    u8 *table;
    u8 key;
    u8 *data;
    u8 *rec;
    u32 count;
    u16 i;

    home = D_800885D2 == D_80080C90[D_800886E0].id;
    if (!home) {
        table = D_8007A178[0];
        key = table[D_80080C90[D_80088AE4].id + 1];
    } else {
        table = D_8007A178[1];
        key = table[D_80080C90[D_800886E0].id + 1];
    }
    if (!home) {
        data = D_8007A178[2];
        table = data;
    } else {
        data = D_8007A178[3];
        table = data;
    }
    table += arg1 * 4 + 4;
    rec = data + (table[0] + (table[1] << 8) + (table[2] << 16) + (table[3] << 24));
    count = rec[4];
    table = rec + 5;
    data = table + (u16)count;
    if ((u16)count != 0) {
        for (i = 0; i < (u16)count; i++, table++) {
            if (*table == key) {
                break;
            }
        }
        if (i < (u16)count) {
            table = data + i * 2;
            data += table[0] << 8;
            data += table[1];
        } else {
            data += (u16)count * 2;
        }
    }
    count = *data;
    table = data + 1;
    table += (u16)count;
    for (; (u16)count != 0; count--) {
        s16 value = *table++ << 8;
        value += *table++;
        if (value == arg0) {
            return 1;
        }
    }
    return 0;
}
