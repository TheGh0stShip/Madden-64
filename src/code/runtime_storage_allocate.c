#include "types.h"

extern s32 D_80078430;
extern s32 D_80078434;
extern s32 D_8007843C;
extern void* func_80032E00(s32 type, u32 size);
extern void func_8000DDF0(void);

void func_8000DD90(u16 count) {
    s32 offset = count << 4;

    D_8007843C = offset;
    D_80078430 = (s32)func_80032E00(0, count << 5);
    D_80078434 = D_80078430 + offset;
    func_8000DDF0();
}
