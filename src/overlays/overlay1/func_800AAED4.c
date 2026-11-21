#include "types.h"

typedef struct {
    u8 unk_00;
    u8 unk_01;
    u16 unk_02;
} Key;

typedef struct {
    u8 pad_00[0x18];
    Key unk_18[1];
} Track;

typedef struct {
    u8 pad_00[0x14];
    s32 unk_14;
    s32 unk_18;
    s32 unk_1C[3];
    u8 pad_28[0x14];
    s32 unk_3C;
    s32 unk_40;
    Track *unk_44;
    u8 pad_48[0x14];
    u16 unk_5C[3];
    u8 pad_62[0x22];
    u16 unk_84;
} Anim;

extern volatile u16 D_8008A5B4;
void func_8000C9AC(s32, u16 *);
void func_8000CA20(s32, s32 *);
s16 func_8001A958(u16);

void func_800AAED4(Anim *arg0) {
    Track *track = arg0->unk_44;
    u16 i;

    for (i = 0; i < D_8008A5B4; i++) {
        if (arg0->unk_3C < 0) {
            return;
        }
        while (arg0->unk_3C == arg0->unk_40 + track->unk_18[arg0->unk_18].unk_00) {
            u16 changed = 0;
            s16 value = func_8001A958(track->unk_18[arg0->unk_18].unk_02);

            switch (track->unk_18[arg0->unk_18].unk_01) {
            case 3:
                changed = 1;
                arg0->unk_5C[0] += value;
                break;
            case 4:
                changed = 1;
                arg0->unk_5C[1] += value;
                break;
            case 5:
                changed = 1;
                arg0->unk_5C[2] += value;
                break;
            case 0:
                changed = 1;
                arg0->unk_1C[0] += value << 8;
                break;
            case 1:
                changed = 1;
                arg0->unk_1C[1] += value << 8;
                break;
            case 2:
                changed = 1;
                arg0->unk_1C[2] += value << 7;
                break;
            case 6:
                arg0->unk_40 += value << 8;
                break;
            case 7:
                arg0->unk_3C = -1;
                return;
            }
            if (changed == 1) {
                func_8000C9AC(arg0->unk_14, arg0->unk_5C);
                func_8000CA20(arg0->unk_14, arg0->unk_1C);
            }
            arg0->unk_18++;
        }
        arg0->unk_3C++;
        if (arg0->unk_40 < (arg0->unk_3C & ~0xFF)) {
            arg0->unk_40 += 0x100;
        }
    }
    arg0->unk_84 |= 0x10;
}
