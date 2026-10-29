#include "types.h"

u8 func_80024B90(u16, u16, s32);
u8 func_80024BD4(u16);
u16 func_80028A58(u16);
extern u8 *D_8006B9DC;

u32 *func_8002C3FC(u16 arg0, s32 arg1) {
    s32 off;
    s32 n;
    u32 *p;
    u16 a;
    u16 b;
    s16 i;

    arg1 = (u16)arg1;
    off = 0;
    n = 2;
    if (arg1 < 0x27) {
        if (arg1 >= 0x24) {
            off = 0xF0;
            n = 1;
        }
    }
    p = (u32 *)(D_8006B9DC + (off + 0x5A9C));
    a = func_80024B90(arg0, arg1, off);
    b = func_80024BD4(arg0);
    if (a == 0xFF) {
        return 0;
    }
    p += func_80028A58(a) * n;
    for (i = 0; i < n; i++, p++) {
        if (b == (*p >> 25)) {
            break;
        }
    }
    if (i == n) {
        return 0;
    }
    return p;
}
