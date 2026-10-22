#include "types.h"

extern void func_80016054(void);
extern void func_80035A7C(u16 value);
extern u16 D_8008616C;

void func_80015CFC(void) {
    func_80016054();
    func_80035A7C(D_8008616C);
}
