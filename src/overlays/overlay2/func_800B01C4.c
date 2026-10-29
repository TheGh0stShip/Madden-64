#include "types.h"

#ifndef NULL
#define NULL 0
#endif

s32 func_800167FC(s16, s32);                /* extern */
s32 func_8002E65C(s32, s32 *);          /* extern */
void *func_8008DBEC(s16);                           /* extern */
extern s32 D_8006BFA0;
extern void *D_800C5094;

void func_800B01C4(s32 arg0, s32 arg1) {
    s32 temp_a0;

    temp_a0 = arg0 & 0xFFFF;
    if (temp_a0 >= (*(s16 *)((u8 *)(D_800C5094) + 0x320))) {
        func_8002E65C(arg1, &D_8006BFA0);
        return;
    }
    func_800167FC((*(s16 *)((u8 *)(func_8008DBEC((*(s16 *)((u8 *)(((temp_a0 * 4) + D_800C5094)) + 2)))) + 0xA)), arg1);
}
