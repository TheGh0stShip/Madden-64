#include "types.h"

typedef struct {
    s32 unk0;
    s32 unk4;
    u8 pad8[0x18];
} AudioSlot4B54;

typedef struct {
    s32 unk0;
    volatile s32 frame;
    s32 unk8;
    void *unkC;
    void *unk10;
    AudioSlot4B54 *volatile slots;
} AudioCtx4B54;

void func_80032F3C(s32, void *);
void func_80045CE8(void *);
extern AudioCtx4B54 *D_80064A00;
extern s32 D_80086A30;

void func_80004B54(void) {
    AudioCtx4B54 *ctx;
    s32 n;
    s32 j;
    s32 f;

    ctx = D_80064A00;
    n = 0xF;
    do {
        f = ctx->frame;
        while (ctx->frame == f) {
        }
        j = 7;
        do {
            if (ctx->slots[j].unk0 != 0) {
                ctx->slots[j].unk0--;
            }
            if (ctx->slots[j].unk4 != 0) {
                ctx->slots[j].unk4--;
            }
        } while (j-- != 0);
    } while (n-- != 0);
    n = 1;
    do {
        f = ctx->frame;
        while (ctx->frame == f) {
        }
    } while (n-- != 0);
    func_80045CE8(&D_80086A30);
    n = 1;
    do {
        do {
        } while ((*(volatile u32 *)0xA4500004 >> 2) != 0);
    } while (n-- != 0);
    func_80032F3C(0, D_80064A00->slots);
    func_80032F3C(0, D_80064A00->unkC);
    func_80032F3C(0, D_80064A00->unk10);
    func_80032F3C(0, D_80064A00);
    D_80064A00 = 0;
}
