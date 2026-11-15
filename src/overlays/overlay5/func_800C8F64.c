#include "types.h"

typedef struct TargetC8F64 {
    u8 pad00[0x14];
    s32 flags;
} TargetC8F64;

typedef struct OwnerC8F64 {
    u8 pad00[0x38];
    TargetC8F64 *target;
} OwnerC8F64;

extern s32 func_80030DF0(void);
extern void func_80041650(s32 value);
extern void func_800C91C8(TargetC8F64 *target, s32 mode, OwnerC8F64 *owner);
extern s32 func_800D1CA0(void);
extern void func_800D63B4(OwnerC8F64 *owner);
extern void func_800DD4B8(void);
extern void func_800DD514(s32 value);
extern void func_800DD634(void);
extern void func_800DE84C(void *state);
extern void func_800DF72C(void);
extern s8 D_800892B0;
extern u8 D_800E5F60[];

void func_800C8F64(OwnerC8F64 *owner, s32 unused, s32 mode) {
    func_800DD634();
    if ((func_80030DF0() & 0x4000) && D_800892B0 == 1) {
        func_800DD514(0);
    }

    switch ((s16)mode) {
    case 13: {
        TargetC8F64 *target;

        func_800C91C8(owner->target, 0, owner);
        target = owner->target;
        target->flags &= ~1;
        if (D_800892B0 == 1) {
            s32 result;

            result = func_800D1CA0();
            if (result != -1) {
                func_80041650(result);
            }
        }
        break;
    }
    case 12:
        func_800D63B4(owner);
        break;
    case 28:
    case 8:
        func_800DF72C();
        if (D_800892B0 == 1) {
            func_800DD514(0);
        } else {
            func_800DE84C(D_800E5F60);
            func_800DD4B8();
        }
        break;
    }
}
