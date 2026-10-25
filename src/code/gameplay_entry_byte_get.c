#include "types.h"

typedef struct GameplayRecord {
    u8 values[55][40];
    u8 pad898[0x18B4];
} GameplayRecord;

extern GameplayRecord D_80080D78[];

u8 func_80022AD8(u16 group, u16 entry) {
    u8 result;

    if (entry < 55) {
        result = D_80080D78[group].values[entry][0];
    } else {
        result = 0xFF;
    }
    return result;
}
