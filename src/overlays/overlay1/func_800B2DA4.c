#include "types.h"

typedef struct {
    s32 source;
    s16 unk04;
    s16 unk06;
    s16 unk08;
    s16 pad0A;
    s32 flags;
    s32 unk10;
    s32 pad14;
    s32 unk18;
    s32 pad1C[2];
    s32 unk24;
} CreateParams;

extern s32 D_8006B9D4;
extern s32 D_80089350;
extern s32 D_8008B20C;

s32 func_8000D8DC(s32, CreateParams *);
void func_80016FE4(s32);
void func_800AE700(void);

s32 func_800B2DA4(void) {
    CreateParams params;

    func_800AE700();
    params.flags = 0x2090;
    params.unk04 = 1;
    params.unk06 = 0;
    params.unk08 = 0;
    params.unk10 = 0;
    params.unk18 = 0;
    params.unk24 = D_8008B20C;
    params.source = D_8006B9D4;
    D_80089350 = func_8000D8DC(0, &params);
    func_80016FE4(D_80089350);
    return D_80089350;
}
