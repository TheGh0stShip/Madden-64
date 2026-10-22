#include "types.h"

extern u16 D_8008B284;
extern void func_80033384(u16 channel);

void func_80033484(void) {
    D_8008B284 ^= 1;
    func_80033384(D_8008B284);
}
