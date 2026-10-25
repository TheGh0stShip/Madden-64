#include "types.h"

extern void *D_80078458;
extern void *D_80065428;
extern s32 D_8006542C;
extern u16 D_800892FC;
extern void func_80032F3C(s32 value, void *pool);
extern void func_80034978(void);
extern void func_80035A7C(u16 value);

void graphics_pools_release(void)
{
    if (D_80078458 != 0) {
        func_80032F3C(0, D_80078458);
        D_80078458 = 0;
    }
    if (D_80065428 != 0) {
        func_80032F3C(0, D_80065428);
        D_80065428 = 0;
    }
    D_8006542C = 0;
    func_80034978();
    func_80035A7C(D_800892FC);
}
