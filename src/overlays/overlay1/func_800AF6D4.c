#include "types.h"

extern u8 D_8006E000[];
extern u8 D_8006E008[];
extern u8 D_8006E010[];

void func_800167FC(s16, u8 *);
void func_8002E65C(u8 *, u8 *);
s32 func_8004DF94(u8 *);
void func_800AB2D0(u8 *, s16);

void func_800AF6D4(u8 *arg0, s16 arg1, s16 arg2) {
    s32 offset;

    func_800AB2D0(arg0, arg1);
    func_8002E65C(arg0 + (s16)func_8004DF94(arg0), D_8006E000);
    offset = func_8004DF94(arg0);
    if (arg2 == 0) {
        func_8002E65C(arg0 + (s16)offset, D_8006E008);
    } else if (arg2 > 0) {
        func_800167FC(arg2, arg0 + (s16)offset);
    } else {
        func_8002E65C(arg0 + (s16)offset, D_8006E010);
    }
}
