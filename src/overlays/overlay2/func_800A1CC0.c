#include "types.h"

typedef struct {
    u8 low;
    u8 high;
    u8 limit;
    u8 value;
    u8 pad[2];
} Range;

extern Range D_800C4FBC[];

u8 func_800A1CC0(s16 index) {
    if (D_800C4FBC[index].limit > D_800C4FBC[index].value) {
        return D_800C4FBC[index].low;
    }
    return D_800C4FBC[index].high;
}
