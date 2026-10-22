#include "types.h"

void func_8000DC00(void) {
}

void func_8000DC08(u8* node) {
    *(u32*)(node + 0x14) |= 1;
}

void func_8000DC18(u8* node) {
    *(u32*)(node + 0x14) &= ~1;
}
