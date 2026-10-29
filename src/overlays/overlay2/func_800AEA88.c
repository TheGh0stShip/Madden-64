#include "types.h"

#ifndef NULL
#define NULL 0
#endif

s32 func_800AE460(void *);                      /* extern */
s32 func_800AE734(void *, u16);                 /* extern */
void func_800DD4B8(void);                         /* extern */

void func_800AEA88(void *arg0) {
    s32 temp_a0;
    void *temp_v1;

    temp_v1 = (*(void **)((u8 *)(arg0) + 0x60));
    temp_a0 = (*(s32 *)((u8 *)(temp_v1) + 0));
    switch (temp_a0) {                              /* irregular */
    case 0:
        func_800DD4B8();
        return;
    case 1:
        (*(s8 *)((u8 *)(temp_v1) + 0x14)) = 0;
        (*(s32 *)((u8 *)(temp_v1) + 0)) = 0;
        (*(u16 *)((u8 *)(temp_v1) + 8)) = (u16) (*(u16 *)((u8 *)(temp_v1) + 0xA));
        func_800AE734(arg0, (*(u16 *)((u8 *)(temp_v1) + 6)));
        func_800AE460(arg0);
        return;
    }
}
