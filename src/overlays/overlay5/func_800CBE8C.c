#include "types.h"

typedef struct {
    u32 unk_0;
    s16 unk_4;
    s16 unk_6;
    u8 *unk_8;
} Sub;

typedef struct {
    u8 pad[8];
    Sub *unk_8;
} Obj;

extern u8 *D_800869C8;
void func_8000DBA4(Obj *obj, s32 arg1, u8 *arg2);

void func_800CBE8C(u16 arg0, u16 arg1, u32 arg2, u32 arg3, Obj *obj) {
    Sub *sub = obj->unk_8;
    u16 sel = arg1;
    u8 *p;

    if (arg1 != 0) {
        sel = 1;
    }
    p = D_800869C8;
    p += (u16)(arg0 ^ 1) << 6;
    p += sel << 5;
    sub->unk_6 = 0x10;
    sub->unk_4 = 0;
    sub->unk_0 = arg3;
    func_8000DBA4(obj, 0, sub->unk_8 = p);
    p = D_800869C8 + 0x80;
    p += arg0 * 0x180;
    p += arg1 * 0x80;
    sub->unk_6 = 0x40;
    sub->unk_0 = arg2;
    func_8000DBA4(obj, 0, sub->unk_8 = p);
}
