#include "types.h"

void func_800167FC(s16, u8 *);
void func_8002E65C(u8 *, char *);

void func_800945D8(u16 arg0, u8 *buf) {
    char tmp[6] = "$131K";
    f64 d;
    u8 *p;
    u8 c;

    if (arg0 < 7) {
        func_8002E65C(buf, tmp);
        return;
    }
    d = arg0 * 2.3;
    buf[0] = '$';
    func_800167FC((u32)d, buf + 1);
    for (p = buf + 1; *p != 0; p++) {
    }
    if (d > 100.0) {
        p -= 2;
        c = *p;
        *p++ = '.';
        *p++ = c;
        *p++ = 'M';
    } else {
        *p++ = '0';
        *p++ = 'K';
    }
    *p = 0;
}
