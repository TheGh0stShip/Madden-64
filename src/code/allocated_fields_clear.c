#include "types.h"

typedef void* (*AllocateCallback)(void* owner, s32 value, u32 size);

void func_800633C0(u8* owner) {
    AllocateCallback allocate = *(AllocateCallback*)(*(u8**)(owner + 4));
    u8* object = allocate(owner, 0, 0x84);
    *(u32*)(object + 0x80) = 0;
}

void func_800633EC(u8* owner) {
    AllocateCallback allocate = *(AllocateCallback*)(*(u8**)(owner + 4));
    u8* object = allocate(owner, 0, 0x118);
    *(u32*)(object + 0x114) = 0;
}
