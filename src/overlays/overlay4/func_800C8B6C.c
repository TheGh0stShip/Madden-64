#include "types.h"

typedef struct {
    u8 pad0[0x1C];
    s32 unk1C;
    s32 unk20;
    s32 unk24;
    u8 pad28[4];
    u8 unk2C[8];
    s32 unk34;
} S6178;
typedef struct { s32 x; s32 y; s32 z; } Vec3i;

extern s32 func_8002E7A0(s32, s32);
extern void func_800B9274(s16, void *, s32);
extern void func_800C6330(s32);
extern void func_800C67CC(s32, s32);
extern S6178 *D_80086178;

void func_800C8B6C(Vec3i *arg0, s32 arg1, s16 arg2) {
    func_800C6330(0);
    D_80086178->unk1C = arg0->x;
    D_80086178->unk20 = arg0->y;
    D_80086178->unk24 = arg0->z;
    D_80086178->unk34 = func_8002E7A0(0xFFFC0000, arg1);
    func_800B9274(arg2, D_80086178->unk2C, 0x20000);
    func_800C67CC(0xCC, 0);
}
