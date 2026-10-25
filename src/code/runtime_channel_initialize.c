#include "types.h"

extern void* D_800740C4;
extern void func_80033308(s32 channel, void* context, s32 size, s32 flags);

void func_8003E980(void) {
    func_80033308(0, D_800740C4, 0x1E4, 0);
}
