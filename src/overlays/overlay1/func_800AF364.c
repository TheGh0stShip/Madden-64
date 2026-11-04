#include "types.h"

extern void func_8000D874(void *, void *);
extern s32 func_8001AEA8(s32);
extern void *D_8006B8F8;
extern void *D_8006B900;
extern s32 D_8007A180;
extern u16 D_8008A71C;

void func_800AF364(void) {
    D_8008A71C |= 1;
    func_8000D874(D_8006B8F8, D_8006B900);
    D_8007A180 = func_8001AEA8(0);
}
