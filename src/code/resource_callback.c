#include "types.h"

void func_8001AF98(u8* wrapper, void* callback) {
    u8* resource = *(u8**)(wrapper + 8);

    *(void**)(resource + 4) = callback;
}
