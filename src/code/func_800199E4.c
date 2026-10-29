#include "types.h"

s32 func_80019868(s32, void *, u16, s32);

typedef struct {
    u16 count;
    u8 a;
    u8 b;
} Hdr199E4;

void func_800199E4(s32 arg0, u16 arg1, s32 *arg2, u8 *arg3) {
    Hdr199E4 h;
    u16 i;
    u16 n;
    s32 len;

    switch (arg1) {
    case 4:
        arg1 = 0x100;
        break;
    case 0xB:
        arg1 = 0x40;
        break;
    }
    func_80019868(arg0, &h.count, 2, 0);
    for (i = 0; i < h.count; i++) {
        func_80019868(arg0, &h.a, 1, 2);
        func_80019868(arg0, &h.b, 1, 2);
        *arg2 += h.a * 3;
        n = h.b;
        if (n == 0) {
            n = arg1;
        }
        len = n * 3;
        func_80019868(arg0, arg3 + *arg2, len, 2);
        *arg2 += len;
    }
}
