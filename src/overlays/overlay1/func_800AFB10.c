#include "types.h"

s32 func_8004DF94(char *);
void func_800167FC(s32, char *);

void func_800AFB10(char *buf, s32 value) {
    s16 len;
    char *p;
    s16 frac;

    buf[0] = 0;
    if ((value >> 16) == 0 && (s16)value < 0) {
        buf[0] = '-';
        buf[1] = 0;
    }
    func_800167FC(value >> 16, buf + func_8004DF94(buf));
    len = func_8004DF94(buf);
    p = buf + len;
    *p = '.';
    frac = value;
    if (frac < 0) {
        frac = -value;
    }
    func_800167FC(frac, p + 1);
}
