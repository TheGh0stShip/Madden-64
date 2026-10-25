#include "types.h"

extern void* D_800740C4;
extern u16 D_800740C8;
extern const u8 D_80002E68[];
extern void* func_80032E00(s32 type, u32 size);
extern void func_800E2068(const void* source, void* destination, s32 count);

void func_8003EB2C(void) {
    void* buffer = func_80032E00(0, 0x1E4);

    D_800740C4 = buffer;
    func_800E2068(D_80002E68, buffer, 1);
    D_800740C8 = 1;
}
