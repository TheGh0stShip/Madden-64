#include "types.h"

extern u16 D_80085BF8;
extern void* D_8008A700;
extern void func_80035A7C(u16 value);
extern void func_80033258(void* resource);

void func_80016EE4(void) {
    func_80035A7C(D_80085BF8);
    if (D_8008A700 != 0) {
        func_80033258(D_8008A700);
    }
}
