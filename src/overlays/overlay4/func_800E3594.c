#include "types.h"

typedef struct {
    u8 unk_00[0x28];
    u16 unk_28;
} Obj800E1CF4;

void func_8004DF68(void *dst, void *src, s32 size);

void func_800E3594(Obj800E1CF4 *arg0, Obj800E1CF4 *arg1) {
    s32 buf[10];
    s32 *tmp = buf;
    s32 a = arg0->unk_28 & 0x10;
    s32 b = arg1->unk_28 & 0x10;
    s32 n = 10;
    s32 *p;
    s32 *q;

    a = a != 0;
    p = (s32 *)(a * 4 + (s32)arg0 + 0x64);
    a = (n - a) * 4;
    b = b != 0;
    func_8004DF68(tmp, p, a);
    q = (s32 *)(b * 4 + (s32)arg1 + 0x64);
    func_8004DF68(p, q, a);
    func_8004DF68(q, tmp, (n - b) * 4);
}
