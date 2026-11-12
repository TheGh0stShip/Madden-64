#include "types.h"

typedef struct {
    u8 pad0[8];
    u16 unk8;
    u8 padA[0xC];
    u16 unk16;
} S48;

typedef struct {
    u8 pad0[0x1C];
    s32 unk1C;
    s32 unk20;
    u8 pad24[8];
    s32 unk2C;
    s32 unk30;
    u8 pad34[0x14];
    S48 *unk48;
} SObj;

extern void func_8003CF78(s32, s32);
extern void func_800C6920(void);
extern SObj *D_80086178;
extern s32 D_80086C78;
extern s32 D_80086C7C;
extern u16 D_8008A5B2;

s32 func_800C8854(SObj *arg0, SObj *arg1) {
    SObj *tmp;
    SObj *p;
    s32 st;

    arg0++;
    arg0--;
    if (1 != arg0->unk48->unk16) {
        tmp = arg0;
        arg0 = arg1;
        arg1 = tmp;
    }
    st = D_8008A5B2;
    if (st < 8) {
        if (st < 2) {
            return 0;
        }
        func_8003CF78(0x16, 0xA);
        p = D_80086178;
        p->unk1C = D_80086C78;
        if (!(!(p->unk20 < arg1->unk20))) {
            p->unk20 = arg1->unk20 - (((arg1->unk48->unk8 + 1) + arg0->unk48->unk8) << 16);
        } else {
            p->unk20 = D_80086C7C;
        }
        D_80086178->unk2C = D_80086178->unk2C / 2;
        D_80086178->unk30 = -(D_80086178->unk30 / 2);
        func_800C6920();
        return 1;
    }
    return 0;
}
