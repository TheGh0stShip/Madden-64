#include "types.h"

extern u8 D_80085A00;
extern volatile s32 D_80086170[];
extern void * volatile D_800855D8[];
extern volatile s32 D_80087908[];
extern volatile u16 D_80089516;
extern volatile u16 D_8008B070;
extern u8 D_8008B398;
extern void func_8004CDA8(void *, s32, s32);
extern void func_8004EDA8(void *);
extern void func_8000BB98(u16);

void display_system_run(void)
{
    void *buffer;
    u16 index;
    u16 toggle;

    while (1) {
        func_8004CDA8(&D_80085A00, 0, 1);
        D_80086170[D_80089516] = 2;
        index = D_80089516;
        toggle = D_80089516;
        buffer = D_800855D8[index];
        D_80089516 = toggle ^ 1;
        func_8004EDA8(buffer);
        D_8008B070 |= 1;
        if (D_80087908[D_80089516] != 0) {
            D_80087908[D_80089516] = 0;
            func_8000BB98(D_80089516);
        }
        func_8004CDA8(&D_8008B398, 0, 1);
    }
}
