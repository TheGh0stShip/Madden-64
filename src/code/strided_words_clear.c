#include "types.h"

typedef struct StridedWord {
    u32 value;
    u8 pad4[0xC];
} StridedWord;

extern StridedWord D_80074978[];

void func_8004519C(void) {
    s32 index = 3;

    do {
        D_80074978[index].value = 0;
    } while (index-- != 0);
}
