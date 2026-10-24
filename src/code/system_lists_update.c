#include "types.h"

extern s16 D_80065502;
extern s16 D_80065504;
extern s16 D_8006550C;
extern void func_80011488(void);

void func_80011AF4(void) {
    if (D_80065502 != 0) {
        func_80011488();
        D_80065504 = 0;
    } else {
        D_8006550C = 1;
    }
}
