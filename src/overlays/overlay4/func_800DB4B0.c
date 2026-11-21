#include "types.h"

typedef struct {
    s8 unk_00;
    s8 unk_01;
    s8 unk_02;
} Msg;

typedef struct {
    u8 pad_00[0x2C];
    s32 unk_2C;
    s32 unk_30;
} Sub;

typedef struct {
    u8 pad_00[0x24];
    Sub *unk_24;
    u8 pad_28[0x4];
    s32 unk_2C;
    s16 unk_30;
} Obj;

extern Obj *D_80080C2C;
extern s32 D_80087B60;
extern Obj *D_8008A058;
extern u16 D_8008A5B2;
void func_800C0BBC(Obj *, s32);
void func_800E1A84(Obj *, Msg *);

s32 func_800D9C10(Obj *arg0) {
    Msg m;

    if (arg0->unk_30 != 0 || arg0->unk_24->unk_2C != 0 || arg0->unk_24->unk_30 != 0) {
        if (arg0 == D_8008A058) {
            Msg m2;
            D_80087B60 = 0x2E0003;
            m2.unk_00 = 9;
            m2.unk_01 = 0;
            m2.unk_02 = 0;
            func_800E1A84(arg0, &m2);
            return 1;
        }
    }
    if (D_80080C2C != 0 && D_80080C2C->unk_30 != 0) {
        D_80087B60 = 0x2E0003;
        m.unk_00 = 9;
        m.unk_01 = 0;
        m.unk_02 = 0;
        func_800E1A84(arg0, &m);
        return 1;
    }
    if (arg0 == D_8008A058 && arg0->unk_2C != 0x302) {
        func_800C0BBC(arg0, 0x302);
    }
    if (D_8008A5B2 == 7 && arg0->unk_2C != 0x301) {
        func_800C0BBC(arg0, 0x301);
    }
    if (D_8008A5B2 == 4) {
        m.unk_00 = 0x12;
        func_800E1A84(arg0, &m);
        return 1;
    }
    return 0;
}
