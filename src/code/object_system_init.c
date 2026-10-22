#include "types.h"

extern void func_8000BE80(void);
extern void func_8000D684(void* object);
extern void* func_8000D5BC(s32, s32, s32);
extern void func_80033484(void);
extern void* D_8008931C;

void func_8000CDC0(void) {
    func_8000BE80();
    func_8000D684(D_8008931C);
    D_8008931C = func_8000D5BC(0, 0, 0);
    func_80033484();
}
