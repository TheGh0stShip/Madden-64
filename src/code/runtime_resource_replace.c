#include "types.h"

extern u16 D_80085BF8;
extern void func_80035A7C(u16 value);
extern u16 func_800356C4(void* source, void* descriptor);

#ifndef FUNCTION
#define FUNCTION func_80016F24
#endif

#ifdef DIRECT_ARGS
void FUNCTION(void* source, void* descriptor) {
#else
void FUNCTION(s32 unused, void* source, void* descriptor) {
#endif
    func_80035A7C(D_80085BF8);
    D_80085BF8 = func_800356C4(source, descriptor);
}
