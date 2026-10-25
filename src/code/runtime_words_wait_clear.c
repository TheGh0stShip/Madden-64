#include "types.h"

extern volatile u32 D_80086170[2];
extern volatile u32 D_80087908[2];

void func_8000BE80(void) {
    while (D_80086170[0] | D_80086170[1] |
           D_80087908[0] | D_80087908[1]) {
    }
}
