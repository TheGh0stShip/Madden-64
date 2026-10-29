#include "types.h"

typedef struct {
    u8 id;
    u8 unk1;
    u8 unk2;
} Pick;

typedef struct {
    u8 pad[0x60];
    u8 available;
} PlayerInfo;

extern Pick D_800C5A4C[5];
PlayerInfo *func_8003A7B8(u16);

s16 func_80090778(s16 i) {
next:
    i++;
    if (i == 30) {
        goto done;
    }
    if (func_8003A7B8(i)->available != 0) {
        goto next;
    }
    if (i == D_800C5A4C[0].id || i == D_800C5A4C[1].id || i == D_800C5A4C[2].id ||
        i == D_800C5A4C[3].id || i == D_800C5A4C[4].id) {
        if (i < 31) {
            goto next;
        }
    }
done:
    return i;
}
