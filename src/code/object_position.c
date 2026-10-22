#include "types.h"

typedef struct ObjectPosition {
    u16 x;
    u16 y;
    u16 z;
} ObjectPosition;

void func_8000C990(u8* object, ObjectPosition* position) {
    position->x = *(u16*)(object + 0x10);
    position->y = *(u16*)(object + 0x12);
    position->z = *(u16*)(object + 0x14);
}

void func_8000C9AC(u8* object, ObjectPosition* position) {
    *(u16*)(object + 0x10) = position->x;
    *(u16*)(object + 0x12) = position->y;
    *(u16*)(object + 0x14) = position->z;
}
