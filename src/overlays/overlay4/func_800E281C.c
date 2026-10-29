#include "types.h"

typedef struct {
    u8 pad00[0x84];
    u16 flags;
} StateObject;

extern u8 D_8007A1DC;
extern u8 D_80086CE8[];
extern u8 D_800717F8;
extern void func_800A6590(u8 *table, s32 index);

void func_800E281C(StateObject *obj) {
    func_800A6590(D_80086CE8, D_8007A1DC);
    D_800717F8 = 0;
    obj->flags &= 0xFBFF;
}
