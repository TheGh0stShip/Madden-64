#include "types.h"

typedef struct {
    u8 pad00[0x14];
    s32 unk14;
    s32 unk18;
    s32 unk1C;
    s32 unk20;
    u8 pad24[0x20];
    s32 unk44;
    s32 unk48;
    u8 pad4C[4];
    s32 unk50;
} State;

#ifndef NULL
#define NULL 0
#endif

s32 func_8000D834(s32, s32);                    /* extern */
s32 func_8000D874(s32, s32);                    /* extern */
s32 func_80017C24(s32);                         /* extern */
s32 func_80024E9C();                            /* extern */
s32 func_80032F3C(s32, s32);                /* extern */
s32 func_800D57CC();                            /* extern */
s32 func_800D628C(void *);                      /* extern */
void *func_800DD634();                              /* extern */
s32 func_800DD788(s32);                     /* extern */
extern s32 D_80087AA8;
extern s32 D_8008931C;

void func_800AE378(void *arg0) {
    State *temp_s0;

    func_80024E9C();
    temp_s0 = func_800DD634();
    func_80032F3C(0, (*(s32 *)((u8 *)(arg0) + 0x60)));
    func_80032F3C(0, (*(s32 *)((u8 *)(arg0) + 0x80)));
    func_80032F3C(0, (*(s32 *)((u8 *)(arg0) + 0x84)));
    func_80032F3C(0, (*(s32 *)((u8 *)(arg0) + 0x78)));
    func_80032F3C(0, (*(s32 *)((u8 *)(arg0) + 0x7C)));
    func_80032F3C(0, (*(s32 *)((u8 *)(arg0) + 0x218)));
    func_800D57CC();
    temp_s0->unk44 = 0;
    func_8000D874(D_80087AA8, (*(s32 *)((u8 *)(arg0) + 0x3C)));
    func_8000D834(D_8008931C, (*(s32 *)((u8 *)(arg0) + 0x3C)));
    temp_s0->unk14 = 0;
    temp_s0->unk18 = 0;
    temp_s0->unk1C = 0;
    temp_s0->unk20 = 0;
    func_80017C24(temp_s0->unk48);
    temp_s0->unk48 = 0;
    func_800DD788(0x12);
    temp_s0->unk50 = 0;
    func_800D628C(arg0);
}
