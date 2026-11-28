#include "types.h"

extern char D_80086DB0[];
extern char D_8006DFA4[];
extern char D_8006DFB0[];
extern char D_8006DFC0[];
extern char D_8006DFC8[];
extern char D_8006DFD8[];
extern char D_8006DFE4[];

s32 func_8004DF94(char *);
void func_8004DF68(char *, char *, s32);
void func_8002E65C(char *, char *);
void func_800167FC(s16, char *);
s16 func_800B932C(s16, s16);

/* recipe: --symbol=func_800B932C:0x800B932C (catalogue func_800BDA50) */
/* Builds the play-result text ("A LOSS OF n YARDS", "NO GAIN", ...) for a gain in 1/16 yards. */
char *func_800B18A8(s16 gain) {
    s16 len;
    char *end;

    if (gain <= 0) {
        if (gain < -8) {
            if (gain < -16) {
                len = func_8004DF94(D_8006DFA4);
                end = D_80086DB0 + len;
                func_8004DF68(D_80086DB0, D_8006DFA4, len);
                func_800167FC(-func_800B932C(0, gain), end);
                end = D_80086DB0 + func_8004DF94(D_80086DB0);
                func_8002E65C(end, D_8006DFE4);
                if (func_800B932C(0, gain) == -1) {
                    D_80086DB0[func_8004DF94(D_80086DB0) - 1] = 0;
                }
            } else {
                func_8002E65C(D_80086DB0, D_8006DFB0);
            }
        } else {
            func_8002E65C(D_80086DB0, D_8006DFC0);
        }
    } else if (gain < 16) {
        func_8002E65C(D_80086DB0, D_8006DFC8);
    } else {
        len = func_8004DF94(D_8006DFD8);
        end = D_80086DB0 + len;
        func_8004DF68(D_80086DB0, D_8006DFD8, len);
        func_800167FC(func_800B932C(0, gain), end);
        end = D_80086DB0 + func_8004DF94(D_80086DB0);
        func_8002E65C(end, D_8006DFE4);
        if (func_800B932C(0, gain) == 1) {
            D_80086DB0[func_8004DF94(D_80086DB0) - 1] = 0;
        }
    }
    return D_80086DB0;
}
