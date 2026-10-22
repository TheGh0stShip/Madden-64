#include "types.h"

extern u16 D_800892FC;
extern void* func_80035D7C(u16, void*);
extern void func_80034858(void*);

void func_8003489C(void* source) {
    void* resource = func_80035D7C(D_800892FC, source);

    func_80034858(resource);
}
