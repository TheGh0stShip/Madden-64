#include "types.h"

typedef struct { u8 pad0[0x1C]; s32 unk_1C; s32 unk_20; } Pos;
typedef struct {
    u8 pad0[0x24]; Pos *unk_24; u16 unk_28; u8 pad2A[0x6]; s16 unk_30;
} Player;
typedef struct { u8 pad0[0x24]; s32 unk_24; } S6178;

extern S6178 *D_80086178;
extern s16 D_80084F6E, D_800876F6, D_80089320, D_800876DC, D_80087AAC;
extern Player *D_80085284;
extern s32 D_80080C10;
void func_800C747C(void);
void func_800C872C(Player *);
void func_800C2DA0(void);
void func_8009CA5C(s32, s32);
void func_800C61E8(Player *);

s32 func_800CA38C(Player *arg0) {
    Pos *pos;

    if (D_80086178->unk_24 > 0xA0000) {
        func_800C747C();
        return 0;
    }
    if (arg0->unk_28 & 8) {
        D_80084F6E = 6;
        func_800C872C(arg0);
        D_800876F6 = 0;
        func_800C2DA0();
        arg0->unk_30 = 0;
        if (D_80089320 == 0 || D_80089320 == 4 ||
            ((D_800876DC == 2 || D_800876DC >= 4) && D_80087AAC < 0x79)) {
            if (arg0 != D_80085284 && !(D_80080C10 & 1)) {
                func_8009CA5C(0x2D, 0xD2);
            }
        }
        return 0;
    }
    pos = arg0->unk_24;
    if (pos->unk_1C > -0x1900000 && pos->unk_1C < 0x1900000 &&
        pos->unk_20 > -0x3C00000 && pos->unk_20 < 0x3C00000) {
        if (D_80089320 == 0) {
            func_800C61E8(arg0);
            ((s32 (*)(s32, s32))func_8009CA5C)(0x2D, 0xD2);
            return 0;
        }
        D_80084F6E = 6;
        func_800C872C(arg0);
        arg0->unk_30 = 0;
    }
    return 0;
}
