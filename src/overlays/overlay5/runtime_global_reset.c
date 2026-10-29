#include "types.h"

extern void *D_80084F28[];
extern s16 D_80084F6C;
extern void *D_80085018;
extern u8 D_800880D0[];
extern u8 D_800878D4[];

void func_80045B68(void *system, void *configuration, s32 mode);

void overlay5_runtime_global_reset(void) {
    s8 index;

    index = 0;
    do {
        D_80084F28[index] = 0;
        index++;
    } while (index <= 0);
    func_80045B68(D_800880D0, D_800878D4, 1);
    D_80084F6C = 0;
    D_80085018 = 0;
}
