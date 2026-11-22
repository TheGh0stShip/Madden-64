#include "types.h"

void func_800167FC(s16, s8 *);
extern f64 D_80002E50;
extern f64 D_80002E60;

void func_800BD5B0(u16 size, s8 *buf) {
    f64 kb;
    s8 *p;
    s8 c;

    kb = size * D_80002E50;
    buf[0] = '$';
    func_800167FC((u32)kb, buf + 1);
    for (p = buf + 1; *p != 0; p++) {
    }
    if (kb > D_80002E60) {
        p -= 2;
        c = p[0];
        *p++ = '.';
        *p++ = c;
        *p++ = 'M';
    } else {
        *p++ = '0';
        *p++ = 'K';
    }
    *p = 0;
}
