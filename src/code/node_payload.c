#include "types.h"

void func_8000E424(u8* node, void* payload) {
    u8* child = *(u8**)(node + 8);

    *(void**)(child + 0xF8) = payload;
}
