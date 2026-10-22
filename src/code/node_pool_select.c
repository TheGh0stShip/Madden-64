#include "types.h"

extern u16 D_8008AFD4;
extern void* D_80078430[];
extern void* D_80078438;

void func_8000DDF0(void) {
    D_80078438 = D_80078430[D_8008AFD4];
}
