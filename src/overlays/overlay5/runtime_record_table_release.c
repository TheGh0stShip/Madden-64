#include "types.h"

extern void *D_80085018;

void func_80032F3C(s32 pool, void *memory);

void overlay5_runtime_record_table_release(void) {
    if (D_80085018 != 0) {
        func_80032F3C(0, D_80085018);
    }
    D_80085018 = 0;
}
