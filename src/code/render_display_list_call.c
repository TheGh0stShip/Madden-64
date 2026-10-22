#include "types.h"

extern u32* D_80084F5C;
extern void func_80008FA0(void);

void func_8000AD84(u32 display_list) {
    u32* command = D_80084F5C;

    D_80084F5C = command + 2;
    command[0] = 0x06000000;
    command[1] = display_list;
    func_80008FA0();
}
