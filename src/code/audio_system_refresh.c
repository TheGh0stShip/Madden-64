#include "types.h"

extern s16 D_80087A68;
extern void func_80041E4C(void);
extern void func_800418F8(void);
extern void func_8003D0C4(s32 value);

void func_80041804(void) {
    func_80041E4C();
    func_800418F8();
    func_8003D0C4(6);
    if (D_80087A68 == 1) {
        func_8003D0C4(30);
    }
}
