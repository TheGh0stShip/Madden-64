#include "types.h"

extern void* D_80087100[];
extern void* func_80030DF0(void);

void* func_80030B54(s16 index) {
    void* result;

    if (index != -1) {
        result = D_80087100[index];
    } else {
        result = func_80030DF0();
    }
    return result;
}
