#include "types.h"

typedef struct PointerRecord {
    void* active;
    u8 pad4[0x10];
    void* value;
} PointerRecord;

extern PointerRecord D_8008B078[];

u16 func_80035674(void* value) {
    s32 index = 15;
    s32 offset = 15 * sizeof(PointerRecord);

    do {
        if (*(void**)((u8*)D_8008B078 + offset) != 0 &&
            *(void**)((u8*)D_8008B078 + offset + 0x14) == value) {
            return (u16)index;
        }
        offset -= sizeof(PointerRecord);
    } while (index-- != 0);
    return 0xFFFF;
}
