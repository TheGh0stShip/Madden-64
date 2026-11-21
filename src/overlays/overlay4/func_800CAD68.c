#include "types.h"

typedef struct {
    u8 unk_00[0x1C];
    s32 unk_1C;
    s32 unk_20;
    u8 unk_24[8];
    s32 unk_2C;
    s32 unk_30;
} Unk800CAD68_Pos;

typedef struct {
    u8 unk_00[0x19];
    u8 unk_19;
    u8 unk_1A[4];
    u8 unk_1E;
    u8 unk_1F[2];
    u8 unk_21;
    u8 unk_22[2];
    Unk800CAD68_Pos *unk_24;
} Unk800CAD68_Player;

typedef struct {
    s8 unk_00;
    u8 unk_01[7];
} Unk800CAD68_Msg;

extern s32 D_80080C10;
extern s32 D_80084F34;
extern Unk800CAD68_Player *D_80085040[][22];
u16 func_80031A1C(s32);
s16 func_800B9208(s32 *);
s16 func_800C157C(Unk800CAD68_Player *);
s32 func_800C1608(Unk800CAD68_Player *);
void func_800C16A0(Unk800CAD68_Player *, s16);
void func_800E1BCC(Unk800CAD68_Player *, Unk800CAD68_Msg *);

s32 func_800CAD68(Unk800CAD68_Player *arg0) {
    Unk800CAD68_Msg msg;
    Unk800CAD68_Pos *other;
    s16 i;
    s16 flag;
    s32 dx;
    s32 dz;
    s32 dist;
    s32 adj;

    if (arg0->unk_24->unk_20 > 0x1E00000 && arg0->unk_24->unk_20 < 0x3200000
        && D_80084F34 < arg0->unk_24->unk_20) {
        dist = (func_800C1608(arg0) + 2) & 7;
        if (dist >= 1 && dist <= 3 && (D_80080C10 & 8)) {
            flag = 1;
            for (i = 0; i < 11; i++) {
                other = D_80085040[arg0->unk_1E ^ 1][i]->unk_24;
                dx = other->unk_1C - arg0->unk_24->unk_1C;
                if (dx < 0) {
                    dx = -dx;
                }
                dz = other->unk_20 - arg0->unk_24->unk_20;
                if (dz < 0) {
                    dz = -dz;
                }
                if (dx < dz) {
                    dist = dz + dx / 2;
                } else {
                    dist = dx + dz / 2;
                }
                if (dist <= 0x6FFFFF) {
                    flag = 0;
                    break;
                }
            }
            if (flag == 1) {
                if (!(arg0->unk_21 & 0xC0)) {
                    if (arg0->unk_19 >= 0xB5 && (((func_800C157C(arg0) + 0x100) & 0xFFF) >> 9) == 0
                        && func_80031A1C(100) < 50) {
                        adj = arg0->unk_24->unk_2C;
                        if (adj < 0) {
                            adj += 3;
                        }
                        dz = arg0->unk_24->unk_30;
                        adj >>= 2;
                        if (adj < 0) {
                            adj = -adj;
                        }
                        dz += adj;
                        arg0->unk_24->unk_30 = dz;
                        arg0->unk_24->unk_2C /= 2;
                        func_800C16A0(arg0, func_800B9208(&arg0->unk_24->unk_2C));
                        msg.unk_00 = 0x29;
                        func_800E1BCC(arg0, &msg);
                        return 1;
                    }
                    return 0;
                }
                msg.unk_00 = 0x29;
                func_800E1BCC(arg0, &msg);
                return 1;
            }
        }
    }
    return 0;
}
