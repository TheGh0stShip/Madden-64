#include "types.h"

extern u8* D_80084F28;
extern u8 D_80002EE0[];
extern u8 D_80002EE8[];
extern u8 D_80002EF0[];
extern s32 func_8002E628(void* object, u8* name);
extern u8* func_800E24EC(void* object, u8* name);
extern void func_800E2584(void* destination, void* source, s32 size);

s32 func_800E2278(u8* object, s32 offset, s16 enabled) {
    u8* buffer;
    s32 size;
    s32 length;
    u8* record;

    if ((func_8002E628(object, D_80002EE8) != 0 &&
         func_8002E628(object, D_80002EF0) != 0) || enabled != 0) {
        buffer = func_800E24EC(D_80084F28, D_80002EE0);
        size = *(s32*)(buffer + 4);
        record = buffer;
        length = offset + 12;
        buffer += length;
        func_800E2584(record, object, length);
        size -= length;
        func_800E2584(buffer, D_80002EE0, size);
    }
    return 1;
}
