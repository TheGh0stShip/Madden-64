#include "types.h"

extern s16 D_8006B7A8;
extern u16 D_8007A11C;
extern u16 D_8007A11E;

void func_800A8E88(void);

void func_800AD6AC(void) {
    if (D_8007A11E == 3) {
        if (D_8007A11C == 2) {
            D_8006B7A8 = 4;
        } else {
            func_800A8E88();
        }
    }
}
