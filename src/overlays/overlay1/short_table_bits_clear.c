#include "types.h"

extern u16 D_80086DE8_READ[];
extern u16 D_80086DE8_WRITE[];

void func_800AF5AC(s16 index, u16 mask) {
    D_80086DE8_WRITE[index * 4] = D_80086DE8_READ[index * 4] & ~mask;
}
