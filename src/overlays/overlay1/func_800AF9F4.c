#include "types.h"

extern char D_8006E018[]; /* "st" */
extern char D_8006E01C[]; /* "nd" */
extern char D_8006E020[]; /* "rd" */
extern char D_8006E024[]; /* "th" */

void func_800167FC(s16, char *);
void func_8002E65C(char *, char *);
s32 func_8004DF94(char *);

/* Formats n into buf and appends its English ordinal suffix. */
void func_800AF9F4(char *buf, s16 n) {
    char *suffix;

    func_800167FC(n, buf);
    if ((u16)(n - 11) < 9) {
        suffix = D_8006E024;
    } else {
        switch ((s16)(n % 10)) {
            case 1:
                suffix = D_8006E018;
                break;
            case 2:
                suffix = D_8006E01C;
                break;
            case 3:
                suffix = D_8006E020;
                break;
            default:
                suffix = D_8006E024;
                break;
        }
    }
    func_8002E65C(buf + func_8004DF94(buf), suffix);
}
