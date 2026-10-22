#include "types.h"

extern void func_8000DC7C(void* node);

void func_8000DCF8(u8* node) {
    func_8000DC7C(*(void**)(node + 8));
}
