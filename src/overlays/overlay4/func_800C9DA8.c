#include "types.h"

typedef struct {
    u8 pad0[0x1C];
    s32 unk1C;
    s32 unk20;
    s32 unk24;
} S6178;

extern void func_8003CF78(s32, s32);
extern void func_8009CA5C(s32, s32);
extern void func_800A1A84(s32);
extern void func_800C5F80(void);
extern void func_800C8620(void);
extern void func_800C8674(void);
extern s32 D_80085E5C;
extern S6178 *D_80086178;
extern u8 D_80087AB0;
extern s16 D_800894FC;

void func_800C9DA8(void) {
    S6178 *p;
    s32 ax;
    s32 h;

    if (D_800894FC != 0) {
        return;
    }
    p = D_80086178;
    h = p->unk24;
    if (h != 0) {
        if (p->unk20 < D_80085E5C) {
            return;
        }
        ax = p->unk1C;
        if (ax < 0) {
            ax = -ax;
        }
        if (ax <= 0x410000) {
            if (h > 0x3AFFFF) {
                goto inner;
            }
        }
    }
    D_80087AB0 = 0x11;
    func_800C5F80();
    func_800A1A84(0x1100);
    func_8009CA5C(0x2D, 0xD2);
    return;

inner:
    if (ax <= 0x3AFFFF) {
        if (h > 0x410000) {
            do {
                func_800C8620();
            } while (0);
            func_800A1A84(0x1101);
            return;
        }
    }
    if (D_80086178->unk24 > 0x1010000) {
        func_800C8620();
        func_800A1A84(0x1101);
    } else {
        func_8003CF78(0x19, 0xA);
        func_800C8674();
        func_800A1A84(0x1100);
    }
}
