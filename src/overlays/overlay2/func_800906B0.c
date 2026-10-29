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

extern Pick D_800C5A3A[5];
PlayerInfo *func_8003A7B8(u16);

s16 func_800906B0(s16 i) {
next:
    i++;
    if (i == 30) {
        goto done;
    }
    if (func_8003A7B8(i)->available != 1) {
        goto next;
    }
    if (i == D_800C5A3A[0].id || i == D_800C5A3A[1].id || i == D_800C5A3A[2].id ||
        i == D_800C5A3A[3].id || i == D_800C5A3A[4].id) {
        if (i < 31) {
            goto next;
        }
    }
done:
    return i;
}
