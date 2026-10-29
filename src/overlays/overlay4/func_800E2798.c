#include "types.h"

typedef struct {
    u8 pad00[0x14];
    s32 flags;
} Panel;

typedef struct {
    u8 pad00[0xC];
    s32 value;
    u8 pad10[0x84 - 0x10];
    u16 flags;
} StateObject;

extern u8 D_8007A1DC;
extern Panel *D_80086C88;
extern u8 D_80086CE8[];
extern u8 D_800717F8;
extern u8 func_800A6580(void);
extern void func_800A6590(u8 *table, s32 index);

void func_800E2798(StateObject *obj, s32 value) {
    D_8007A1DC = func_800A6580();
    if (D_80086C88 != 0) {
        D_80086C88->flags |= 1;
    }
    func_800A6590(D_80086CE8, 8);
    obj->value = value;
    D_800717F8 = 1;
    obj->flags |= 0x400;
}
