#include "types.h"

void func_80032F3C(s32 pool, void* object);
extern void* volatile D_8006B9D4;

void func_800AEA60(void) {
    void* object = D_8006B9D4;

    if (object != 0) {
        func_80032F3C(0, object);
    }
    D_8006B9D4 = 0;
}
