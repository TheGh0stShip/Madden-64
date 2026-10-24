#include "types.h"

extern void func_8000D998(u8* parent, void* child);

void func_8000DD1C(u8* object) {
    u8* parent = *(u8**)(object + 8);

    while (*(void**)(parent + 8) != 0) {
        func_8000D998(parent, *(void**)(parent + 8));
    }
}
