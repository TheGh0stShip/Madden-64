#include "types.h"

void* func_800301E0(u8* slot, u16 index) {
    return *(void**)(slot + 8 + index * 4);
}
