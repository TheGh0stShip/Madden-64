#include "types.h"

extern void func_80063418(void);
extern void func_80063494(void);
extern void func_8006345C(void);
extern void func_80063514(void);
extern void func_8006351C(void);
extern void func_80003668(void);

u32* func_80063530(u32* object) {
    object[0] = (u32)func_80063418;
    object[1] = (u32)func_80063494;
    object[2] = (u32)func_8006345C;
    object[3] = (u32)func_80063514;
    object[4] = (u32)func_8006351C;
    object[28] = (u32)func_80003668;
    object[26] = 0;
    object[27] = 0;
    object[5] = 0;
    object[29] = 0x77;
    object[30] = 0;
    object[31] = 0;
    object[32] = 0;
    return object;
}
