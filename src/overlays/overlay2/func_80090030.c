#include "types.h"

#ifndef NULL
#define NULL 0
#endif

void *func_8008DBEC(u8);                            /* extern */

void func_80090030(void *arg0) {
    void *temp_v0;

    temp_v0 = func_8008DBEC((*(u8 *)((u8 *)(arg0) + 0)));
    (*(s8 *)((u8 *)(arg0) + 1)) = (s8) (((*(s8 *)((u8 *)(temp_v0) + 0)) * 2) + ((s8) (*(u8 *)((u8 *)(temp_v0) + 2)) / 2));
    (*(u8 *)((u8 *)(arg0) + 2)) = (u8) (*(u8 *)((u8 *)(temp_v0) + 1));
}
