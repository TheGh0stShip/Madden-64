#include "types.h"

extern void *D_80084F28;

void func_80032F3C(s32 mode, void *allocation);

void overlay5_runtime_storage_release(s16 index) {
    void **storage;

    if (index == 0) {
        storage = &D_80084F28;
        if (*storage != 0) {
            func_80032F3C(0, *storage);
        }
        *storage = 0;
    }
}
