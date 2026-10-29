#include "types.h"

extern u8 D_80080D6A[];

void func_800AFA50(void *, u16, s32, s32);

void func_800AF474(u16 arg0, s32 arg1, void *arg2) {
    func_800AFA50(D_80080D6A + *(u8 *)(*(u8 **)((u8 *)arg2 + 0x60) + 0x14) * 0x214C, arg0, arg1, 2);
}
