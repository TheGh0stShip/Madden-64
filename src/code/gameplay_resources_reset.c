#include "types.h"

extern u16 D_800892FC;
extern u16 D_80087954;
extern void func_80034978(void);
extern void func_80035A7C(u16 value);
extern void func_80045100(void);

void func_8001F70C(void) {
    func_80034978();
    func_80035A7C(D_800892FC);
    func_80045100();
    func_80035A7C(D_80087954);
}
