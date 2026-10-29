#include "types.h"

typedef struct { s16 unk0; s16 unk2; s16 unk4; } S6E28;
extern void func_8000EC8C(s32, S6E28 *);
extern s32 D_80086178;
extern S6E28 D_80086E28;
extern s32 D_8008A058;
extern s16 D_8008A5B2;

void func_800C7A34(s32 arg0) {
    D_8008A058 = arg0;
    D_8008A5B2 = 0;
    D_80086E28.unk0 = 0;
    D_80086E28.unk2 = 0;
    D_80086E28.unk4 = 0;
    func_8000EC8C(D_80086178, &D_80086E28);
}
