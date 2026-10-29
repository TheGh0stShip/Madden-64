#include "types.h"

typedef struct {
    u8 pad00[0x4B];
    u8 page;
} Tally;

extern Tally *D_800895EC;
extern s32 *D_800C3610[];
extern s32 D_80087780[];

void func_800BA684(u16 base) {
    u16 i;

    for (i = 0; i < 5; i++) {
        D_80087780[base + i] = D_800C3610[D_800895EC->page][i];
    }
}
