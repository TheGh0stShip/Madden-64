#include "types.h"

extern u8* D_8008773C;
extern void func_8002FF70(void* child);

void func_8002FE58(void) {
    while (*(void**)(D_8008773C + 0x18) != 0) {
        func_8002FF70(*(void**)(D_8008773C + 0x18));
    }
}
