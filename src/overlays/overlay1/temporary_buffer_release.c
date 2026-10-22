#include "types.h"

void func_80033258(void* object);
extern void* volatile D_800726D0;

void func_800BDCCC(void) {
    func_80033258(D_800726D0);
    D_800726D0 = 0;
}
