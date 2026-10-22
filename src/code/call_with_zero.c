#include "types.h"

extern void CALLEE(s32 value);

void FUNCTION(void) {
    CALLEE(0);
}
