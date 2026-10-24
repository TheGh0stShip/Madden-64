#include "types.h"

extern s16 D_80065502;
extern s16 D_80065504;
extern void func_80011488(void);
extern void func_8000CDC0(void);

void* func_80011AA8(void* object) {
    if (D_80065502 != 0) {
        func_80011488();
        D_80065504 = 0;
        func_8000CDC0();
    }
    return object;
}
