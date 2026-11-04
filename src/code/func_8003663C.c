#include "types.h"

typedef struct { s32 unk0; s32 unk4; s32 unk8; } Sub3663C;
typedef struct { Sub3663C *entries; s32 *sizes; u8 *flags; s32 handle; u8 pad10[8]; } Slot3663C;

void func_800365B8(s32, s32, s32);
void func_80036628(s32, s32, s32);
void func_80036764(u16, s32);
void func_80036A24(u16, s32);
extern s32 D_8007A500;
extern Slot3663C D_8008B078[];

void func_8003663C(u16 id, s32 index, s32 arg2) {
    Sub3663C *e;
    s32 v;

    if (D_8007A500 == 0) {
        e = D_8008B078[id].entries;
        e = (Sub3663C *) ((u32) (index * 12) - (0U - (u32) e));
        v = e->unk8;
        if (v != 0) {
            v &= 0x7FFFFFFF;
            if (v != e->unk4) {
                func_80036764(id, index);
                return;
            }
        }
        func_80036628(D_8008B078[id].handle, D_8008B078[id].entries[index].unk0, 0);
        func_800365B8(D_8008B078[id].handle, D_8008B078[id].sizes[index], arg2);
        return;
    }
    func_80036A24(id, index);
}
