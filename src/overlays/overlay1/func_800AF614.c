#include "types.h"

void func_800167FC(s16 value, char *buf);
s32 func_8004DF94(char *s);

/* Formats a time in seconds as "M:SS" into buf. */
void func_800AF614(s16 arg0, char *buf) {
    s32 seconds;
    s32 minutes;

    seconds = arg0;
    minutes = seconds / 60;
    *buf = 0;
    if ((s16)minutes != 0) {
        func_800167FC(minutes, buf);
    }
    buf += func_8004DF94(buf);
    *buf++ = ':';
    if ((s16)(seconds - minutes * 60) < 10) {
        *buf++ = '0';
    }
    func_800167FC(seconds - minutes * 60, buf);
}
