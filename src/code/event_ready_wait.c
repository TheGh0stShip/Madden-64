#include "types.h"

extern volatile s32 D_80072320;
extern volatile s32 D_80072324;

void func_80032A80(void) {
    D_80072324 = 1;
    while (D_80072320 != 3) {
    }
}
