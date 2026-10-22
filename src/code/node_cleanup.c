#include "types.h"

extern void func_8000DB20(void* node);

void func_8000DD6C(u8* node) {
    func_8000DB20(*(void**)(node + 8));
}
