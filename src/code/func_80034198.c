#include "types.h"

typedef struct {
    s32 unk0;
    void *unk4;
    u8 pad[0xC];
} Entry34198;

typedef struct {
    u8 pad0[0xC];
    s32 unkC;
    u8 pad10[4];
    s32 unk14;
} Src34198;

typedef struct {
    Src34198 *cur;
    u8 pad4[0x14];
    s32 unk18;
    s32 unk1C;
} Dst34198;

typedef struct {
    u8 pad[8];
    Dst34198 *dst;
} Obj34198;

void func_80034164(Src34198 *, Dst34198 *);
u16 func_800349FC(s32, s16 *);
void func_80034FD8(void);
extern Src34198 *D_80069A88;
extern Src34198 *D_80069AB8;
extern Entry34198 *D_800724DC;
extern Src34198 *D_80088630;

s32 func_80034198(Obj34198 *arg0, s32 arg1) {
    Dst34198 *dst;
    Src34198 *src;
    s16 idx;
    s32 type;

    dst = arg0->dst;
    func_80034FD8();
    type = (u32)(arg1 & 0xFF00) >> 8;
    if ((u32)type < 3) {
        switch (type) {
        case 0:
            src = D_80088630;
            break;
        case 1:
            src = D_80069AB8;
            break;
        case 2:
            src = D_80069A88;
            break;
        }
    } else {
        if (func_800349FC(arg1, &idx) != 2) {
            return 0;
        }
        src = D_800724DC[idx].unk4;
    }
    if (src != dst->cur) {
        dst->unk18 = src->unkC;
        dst->unk1C = src->unk14;
        func_80034164(src, dst);
        dst->cur = src;
    }
    return 1;
}
