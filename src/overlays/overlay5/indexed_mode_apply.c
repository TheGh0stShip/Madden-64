#include "types.h"

#ifndef MODE
#define MODE 0
#endif

extern u8 TABLE;
void func_800D3214(void* entry, s32 mode, s32 value);

void overlay5_indexed_mode_apply(u16 index, s32 value) {
    func_800D3214(&TABLE + index * 8, MODE, value);
}
