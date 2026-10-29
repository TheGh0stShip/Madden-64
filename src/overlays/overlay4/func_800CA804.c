#include "types.h"

typedef struct { u8 pad0[8]; u16 unk8; } S48;
typedef struct { u8 pad0[0x1C]; s32 unk1C; s32 unk20; u8 pad24[0x24]; S48 *unk48; } SPos;
typedef struct { u8 pad0[0x24]; SPos *unk24; u16 unk28; } SObj;
extern void func_80041DD4(s32, s32, s32);
extern void func_8009BCB0(void);
extern void func_8009CA5C(s32, s32);
extern void func_800C2DA0(void);
extern void func_800C872C(SObj *);
extern u32 D_80080C10;
extern SObj *D_80080C2C;
extern s32 D_80084F34;
extern s16 D_80084F6E;
extern SPos *D_80086178;
extern s16 D_800876F6;
extern s16 D_80087AF0;
extern s16 D_80088AE4;

s32 func_800CA804(SObj *arg0) {
    SPos *p;
    if (arg0 != D_80080C2C) {
        p = arg0->unk24;
        if ((p->unk1C < 0 ? -p->unk1C : p->unk1C) + p->unk48->unk8 >= 0x1900000) {
            return 0;
        }
        if (D_80088AE4 == 0) {
            func_80041DD4(0x3A, 0xF, 0x1770);
        }
        func_8009BCB0();
        D_80084F6E = 6;
        D_80080C10 &= ~8;
        if (!(arg0->unk28 & 8)) {
            if (D_80084F34 == 0x1E00000 && D_80086178->unk20 >= 0) {
                return 0;
            }
            func_800C872C(arg0);
            D_800876F6 = 0;
            func_8009CA5C(0x2D, 0xD2);
            return 0;
        }
        func_800C872C(arg0);
        D_800876F6 = 0;
        func_800C2DA0();
        D_80087AF0 = 0x46;
    }
    return 0;
}
