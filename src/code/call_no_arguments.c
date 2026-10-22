#include "types.h"

#ifndef FUNCTION
#define FUNCTION func_80008F80
#endif

#ifndef CALLEE
#define CALLEE func_80008FA0
#endif

extern void CALLEE(void);

void FUNCTION(void) {
    CALLEE();
}
