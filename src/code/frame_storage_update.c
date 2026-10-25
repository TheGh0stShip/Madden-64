#include "types.h"

extern void* D_8007343C;
extern char D_80002BB0[];
extern void* func_80032E00(s32 pool, s32 size);
extern void func_800E2068(char* source, void* destination, s16 value);
extern void func_800E2190(char* source, void* destination, s16 value);
extern void func_80032F3C(s32 pool, void* allocation);

void func_8003A720(u16 mode, s16 value) {
    if (mode == 1) {
        D_8007343C = func_80032E00(0, 0x3C0);
        func_800E2068(D_80002BB0, D_8007343C, value);
    } else {
        func_800E2190(D_80002BB0, D_8007343C, value);
        func_80032F3C(0, D_8007343C);
        D_8007343C = 0;
    }
}
