#include "types.h"

extern u16 D_80085BF8;

void func_80016FC4(u16 value) {
    D_80085BF8 = value;
}

u16 func_80016FD4(void) {
    return D_80085BF8;
}

void func_80016FE4(u8* wrapper) {
    u8* object = *(u8**)(wrapper + 8);

    *(u16*)(object + 0x38) = 1;
}

void func_80016FF4(u8* wrapper) {
    u8* object = *(u8**)(wrapper + 8);

    *(u16*)(object + 0x38) = 0;
}

void func_80017000(u8* wrapper, u16 x, u16 y) {
    u8* object = *(u8**)(wrapper + 8);

    *(u16*)(object + 0x16) = x;
    *(u16*)(object + 0x18) = y;
}

void func_80017010(u8* wrapper, u16 value) {
    u8* object = *(u8**)(wrapper + 8);

    *(u16*)(object + 0x3A) = value;
}

void func_8001701C(u8* destination, u8* source) {
    u8* destination_object = *(u8**)(destination + 8);
    u8* source_object = *(u8**)(source + 8);

    *(void**)(destination_object + 8) = *(void**)(source_object + 8);
}
