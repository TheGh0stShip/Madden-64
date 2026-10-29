#include "types.h"

typedef struct {
    u16 lo;
    u16 hi;
} Range41F6C;

u16 func_80031A1C(u16);
void func_80041EF8(s32, s32, u32);
extern Range41F6C D_80074774[];
extern u8 D_80087710[];

u32 func_80041F6C(s32 arg0) {
    u32 cur;
    u32 hi;
    s32 n;
    s32 n0;
    u32 byte;
    s32 bit;

    cur = D_80074774[arg0].lo;
    hi = D_80074774[arg0].hi;
    if ((cur | hi) == 0) {
        return cur;
    }
    n = func_80031A1C(hi - cur) + 1;
    n0 = n;
    while (n != 0) {
        byte = cur >> 3;
        bit = cur & 7;
        if (!((D_80087710[byte] >> bit) & 1)) {
            if (--n == 0) {
                goto found;
            }
        }
        cur++;
        if (hi < cur) {
            cur = D_80074774[arg0].lo;
            if (n == n0) {
                func_80041EF8(arg0, bit, byte);
            }
        }
    }
    byte = cur >> 3;
    bit = cur & 7;
found:
    D_80087710[byte] |= 1 << bit;
    return cur;
}
