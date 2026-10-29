#include "types.h"

typedef struct {
    u8 data[14];
} Entry14;

extern Entry14 D_800C5896[];

Entry14 *func_8008DBEC(s16 index) {
    return &D_800C5896[index];
}
