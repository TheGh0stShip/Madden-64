#include "types.h"

extern u8* func_8003AA28(u16 index);

u16 func_80039824(u16 index) {
    u8* resource = func_8003AA28(index);
    return (resource[0x24] << 8) | resource[0x25];
}
