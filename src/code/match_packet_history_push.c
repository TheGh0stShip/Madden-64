#include "types.h"

typedef struct MatchPacket {
    u8 bytes[12];
} MatchPacket __attribute__((packed));

extern u8 D_800895D0;
extern u8 D_800895D8;
extern MatchPacket D_8008B060;
extern MatchPacket D_80080AA0[];

void func_800299B8(void)
{
    s32 count = D_800895D0;
    s32 slot;

    if ((u8)count < 30) {
        D_800895D0 = count + 1;
        slot = (u8)count;
    } else {
        s32 start = D_800895D8;

        slot = (start + (u8)count) % 30;
        D_800895D8 = (start + 1) % 30;
    }

    D_80080AA0[slot] = D_8008B060;
}
