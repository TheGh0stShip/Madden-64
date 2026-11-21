#include "types.h"

typedef struct { char c[20]; } Lit20;

typedef struct {
    s32 unk_00;
    u8 unk_04;
    u8 unk_05;
    u8 pad06[2];
} StatEntry;

typedef struct {
    u8 pad00[0xE];
    u8 unk_0E;
} Player;

extern Lit20 D_80001B6C;
extern u16 *D_8007A2B0;
extern u8 D_8007A2B4;
extern StatEntry D_800BFFE0[];
extern char *D_800E6B78[];

void func_800167FC(s16, char *);
void func_8002E65C(char *, char *);
Player *func_8003AA28(u16);
u16 func_800D20A0(Player *, s32, u8);

void func_8009BEFC(s32 arg0, s32 arg1, char *arg2) {
    u32 value;

    switch (arg1) {
        case 0:
            if (D_8007A2B4 == 0) {
                *(Lit20 *) arg2 = D_80001B6C;
            } else {
                func_8002E65C(arg2, (char *) func_8003AA28(D_8007A2B0[arg0]));
            }
            break;
        case 1:
            if (D_8007A2B4 != 0) {
                func_8002E65C(arg2, D_800E6B78[func_8003AA28(D_8007A2B0[arg0])->unk_0E & 0x3F]);
            } else {
                arg2[0] = ' ';
                arg2[1] = 0;
            }
            break;
        default:
            if (D_8007A2B4 == 0) {
                arg2[0] = ' ';
                arg2[1] = 0;
            } else {
                value = func_800D20A0(func_8003AA28(D_8007A2B0[arg0]), 0, D_800BFFE0[arg1 - 2].unk_05);
                if (D_800BFFE0[arg1 - 2].unk_05 != 0) {
                    value = (value * 100) / 253;
                }
                func_800167FC(value, arg2);
            }
            break;
    }
}
