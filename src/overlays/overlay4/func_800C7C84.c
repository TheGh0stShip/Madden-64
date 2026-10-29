#include "types.h"

typedef struct { s16 x; s16 y; s16 z; } Vec3s;
typedef struct {
    u8 pad0[0x14];
    s32 unk14;
    u8 pad18[4];
    s32 unk1C;
    s32 unk20;
    s32 unk24;
    u8 pad28[0xC];
    s32 unk34;
} S6178;
extern void func_8000EC8C(S6178 *, Vec3s *);
extern u16 func_800B8C90(S6178 *, u16);
extern void func_800B8EEC(S6178 *, u16);
extern void func_800B98F4(S6178 *);
extern void func_800C675C(void);
extern void func_800C7AD0(void);
extern void func_800C7C04(S6178 *);
extern u32 D_80080C10;
extern u16 D_80080C14;
extern void (*D_80069604[])(void);
extern S6178 *D_80086178;
extern s32 D_80086C78[3];
extern s16 D_80086CB2;
extern Vec3s D_80086CC0;
extern Vec3s D_80086DD0;
extern s16 D_80086E28[3];
extern Vec3s D_800876E0;
extern u16 D_800878D2;
extern s32 D_80087B54;
extern s32 D_8008A058;
extern u16 D_8008A5B2;
extern volatile u16 D_8008A5B4;

void func_800C7C84(void) {
    u16 i;
    void (*fn)(void);
    S6178 *p = D_80086178;
    s32 st;
    if (p->unk14 & 1) {
        D_80086CB2 -= D_8008A5B4;
        if (D_80086CB2 < 0) {
            D_80086CB2 = 0;
        }
        D_800878D2 += D_8008A5B4;
        if (p->unk14 & 1) {
            st = D_8008A5B2;
            if (st != 3) {
                if (st >= 3) {
                    if (st < 8) {
                        func_800B8EEC(p, D_8008A5B4);
                    }
                }
            }
        }
        D_80086C78[0] = D_80086178->unk1C;
        D_80086C78[1] = D_80086178->unk20;
        D_80086C78[2] = D_80086178->unk24;
        if ((func_800B8C90(D_80086178, D_8008A5B4) || D_80086178->unk34 != 0) && D_80086178->unk24 < 0) {
            D_80086178->unk24 = 0;
            D_80080C10 &= ~0x04000000;
            func_800C7C04(D_80086178);
        }

        for (i = 0; i < D_8008A5B4; i++) {
            D_800876E0.x += D_80086E28[0];
            D_800876E0.y += D_80086E28[1];
            D_800876E0.z += D_80086E28[2];
        }
        if (D_80080C14 & 1) {
            func_800C7AD0();
        }
        if (D_80080C14 & 5) {
            if (D_800876E0.x < D_80086CC0.x) {
                D_800876E0.x = D_80086CC0.x;
                D_80086E28[0] = -D_80086E28[0];
            }
            if (D_800876E0.x > D_80086DD0.x) {
                D_800876E0.x = D_80086DD0.x;
                D_80086E28[0] = -D_80086E28[0];
            }
            if (D_800876E0.y < D_80086CC0.y) {
                D_800876E0.y = D_80086CC0.y;
                D_80086E28[1] = -D_80086E28[1];
            }
            if (D_800876E0.y > D_80086DD0.y) {
                D_800876E0.y = D_80086DD0.y;
                D_80086E28[1] = -D_80086E28[1];
            }
        }
        func_8000EC8C(D_80086178, &D_800876E0);
        if (D_8008A058 == 0) {
            D_80086178->unk14 |= 0x200;
            func_800B98F4(D_80086178);
            D_80086178->unk14 &= ~0x200;
        }
    }
    if (D_80080C10 & 0x4000) {
        fn = D_80069604[D_8008A5B2];
        if (fn != 0) {
            fn();
        }
    }
    if (D_80087B54 != 0) {
        func_800C675C();
    }
}
