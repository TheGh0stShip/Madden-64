#include "types.h"

typedef struct {
    u16 magic;
    s16 unk_02;
    u8 pad04[0xC];
    u8 entries[16][13];
    u8 pad[0x12E - 0x10 - 16 * 13];
} SaveA;

typedef struct {
    u16 magic;
    s16 data[0x207];
} SaveB;

extern u8 D_80001408[];
extern SaveA D_800C5098;
extern SaveA D_800C4EE8;
extern SaveB D_800C4AD0;
extern u16 D_80086190[];
extern s16 D_8008A5B0;
extern u8 D_800C5A5E;

s16 func_800E2068(void *, void *, s32);
void func_8008DA98(void);

void func_8008D7B4(void) {
    u16 i;

    if (func_800E2068(D_80001408, &D_800C5098, 1) != -1) {
        D_800C5098.magic = 0;
        D_800C4EE8.magic = 0;
        D_800C4AD0.magic = 0;
    } else if (D_800C5098.magic == 0x5AA5) {
        D_800C4EE8 = D_800C5098;
        D_800C5098.magic = 0;
        D_800C4AD0.magic = 0;
        for (i = 0; i < 16; i++) {
            D_80086190[i] = D_800C4EE8.entries[i][0];
        }
    } else if (D_800C5098.magic == 0xA5A5) {
        D_800C4AD0 = *(SaveB *)&D_800C5098;
        D_800C5098.magic = 0;
        D_800C4EE8.magic = 0;
    }
    if (D_800C5098.magic == 0xA55A && D_8008A5B0 != 1) {
        D_800C4EE8.magic = 0;
        D_800C4AD0.magic = 0;
        if (D_800C5098.unk_02 == 15) {
            D_800C5098.unk_02 = 300;
        }
        if (D_800C5098.unk_02 == 30) {
            D_800C5098.unk_02 = 300;
        }
        func_8008DA98();
    }
    D_800C5A5E = 0x4E;
}
