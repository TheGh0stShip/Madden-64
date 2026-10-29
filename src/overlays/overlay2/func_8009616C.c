#include "types.h"

typedef struct {
    s8 unk0;
    s8 pad[13];
} Entry0E;

extern s8 D_800C509C;
extern u8 D_800C39E8;
extern Entry0E D_800C5896[];

u16 func_80028A58(u16);

u8 func_8009616C(u16 arg0) {
    if (D_800C509C >= 0xF) {
        if (D_800C5896[func_80028A58(arg0)].unk0 < 6) {
            return D_800C39E8;
        }
    }
    return 0;
}
