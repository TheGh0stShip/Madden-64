#include "types.h"

typedef struct {
    u8 pad00[0x64];
    u8 unk_64;
    u8 unk_65;
    u8 unk_66;
} Info;

extern u8 D_80073520[][16];
extern u8 D_80073523[];
extern s8 D_80085104;
extern s16 D_80087A68;
u16 func_80031A1C(s32);
Info *func_8003A7B8(u16);

void func_800A5050(u8 *arg0)
{
    u32 i;
    Info *info;

    for (i = 0; i < 0x29; i++) {
        arg0[i] = 0;
        if (D_80085104 == 1) {
            arg0[i] = D_80087A68;
        }
        if (!(D_80073523[i * 16] & 8)) {
            if (i != 0x7A) {
                info = func_8003A7B8(i);
            } else {
                info = func_8003A7B8(0x68);
            }
            if (func_80031A1C(0xFF) < info->unk_65) {
                arg0[i] = 1;
            }
            if (arg0[i] == 0) {
                if (func_80031A1C(0xFF) < info->unk_66) {
                    arg0[i] = 3;
                }
                if (arg0[i] == 0) {
                    if (!(D_80073523[i * 16] & 4) && func_80031A1C(0xFF) < info->unk_64) {
                        arg0[i] = 2;
                    }
                    if (arg0[i] == 0 && func_80031A1C(8) == 2) {
                        arg0[i] = 4;
                    }
                }
            }
        }
        if (D_80085104 == 1) {
            if (D_80073523[i * 16] & 8) {
                arg0[i] = 0;
            }
            if (D_80085104 == 1 && (D_80073520[i][3] & 4) && D_80087A68 == 2) {
                arg0[i] = 0;
            }
        }
    }
    if (func_80031A1C(2) == 1) {
        arg0[0x13] = arg0[0x14];
    } else {
        arg0[0x14] = arg0[0x13];
    }
}
