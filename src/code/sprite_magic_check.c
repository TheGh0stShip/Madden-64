#include "types.h"

extern void func_80034154(void);

void func_80034164(u32* data) {
    if (*data == 0x54537072) {
        func_80034154();
    }
}
