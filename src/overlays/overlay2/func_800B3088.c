#include "types.h"

typedef struct {
    u8 unk_00[0x18];
    s32 unk_18;
    s32 unk_1C;
    s32 unk_20;
    u8 unk_24[0xCC];
    s32 unk_F0;
    s32 unk_F4;
} Unk800B3088;

typedef struct { u8 v; } ByteS;

extern u8 D_80087960;
extern u8 D_80087965;
extern u8 D_80087966;
extern u8 D_80087967;
extern u8 D_80087968;
extern u8 D_80087969;
extern u8 D_8008796A;
extern u8 D_8008796B;
extern u8 D_8008796C;
extern s8 D_800BF0E1;
extern ByteS D_800BF0F9;
extern ByteS D_800BFB45;
extern ByteS D_800BFB5D;
extern u8 D_800BFC54;
extern ByteS D_800E6FB9;
extern ByteS D_800E7001;
extern ByteS D_800E7011;
extern ByteS D_800E7029;
extern ByteS D_800E7069;
extern ByteS D_800E7099;

s32 func_80032E00(s32, s32);
void func_800B3558(s32, s32, Unk800B3088 *, s32);
void func_800B3700(s32, s32, Unk800B3088 *, s32);
void func_800D5C1C(s32, Unk800B3088 *, void *);

void func_800B3088(Unk800B3088 *arg0) {
    s32 mode;

    switch (mode) {
    case 180:
        D_800BF0E1 = 0;
        break;
    case 300:
        D_800BF0E1 = 1;
        break;
    case 600:
        D_800BF0E1 = 2;
        break;
    case 900:
        D_800BF0E1 = 3;
        break;
    }
    D_800E6FB9.v = D_80087965;
    D_800E7011.v = D_80087966;
    D_800E7069.v = D_80087967;
    D_800E7001.v = D_80087968;
    D_800E7029.v = D_80087969;
    D_800E7099.v = D_8008796A;
    D_800BF0F9.v = D_80087960;
    D_800BFB45.v = D_8008796B;
    D_800BFB5D.v = D_8008796C;
    arg0->unk_18 = 0x3B0;
    arg0->unk_1C = 0;
    arg0->unk_20 = 0xFA;
    func_800D5C1C(0x3A8, arg0, &D_800BFC54);
    arg0->unk_F0 = func_80032E00(0, 8);
    arg0->unk_F4 = func_80032E00(0, 8);
    func_800B3558(3, 0, arg0, 0x1F);
    func_800B3700(3, 0, arg0, 0x20);
}
