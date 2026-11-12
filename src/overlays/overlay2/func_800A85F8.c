#include "types.h"

typedef struct {
    s32 unk00;
    u8 pad04[0x14];
    s32 unk18;
    s32 unk1C;
    s32 unk20;
} Obj;

extern u8 D_800BF454[];
extern u8 D_800BF434[];
extern s16 D_800C5C36;

void func_800D5C1C(s32, Obj *, u8 *);
u16 func_8003A50C(void);
void func_800DFAF8(s32, u8 *, s32);

void func_800A85F8(Obj *obj) {
    if (D_800C5C36 == 1) {
        obj->unk18 = 0x218;
    } else {
        obj->unk18 = 0x228;
    }
    obj->unk20 = 0xFA;
    D_800BF454[0xB] = (obj->unk1C = 0, D_800BF454[0xC] = 6);
    func_800D5C1C(0x210, obj, D_800BF454);
    if (func_8003A50C() >= 0x18) {
        func_800DFAF8(obj->unk00, D_800BF434, 0);
    }
}
