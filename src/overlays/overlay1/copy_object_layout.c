#include "types.h"

typedef struct ObjectLayout {
    u32 words[18];
} ObjectLayout;

void func_8009EB64(u8* object, ObjectLayout* destination) {
    u16 saved = *(u16*)((u8*)destination + 0x3A);
    s32 width;
    s32 height;

    *destination = **(ObjectLayout**)(object + 8);
    width = *(s32*)((u8*)destination + 0x1C);
    height = *(s32*)((u8*)destination + 0x20);
    *(u16*)((u8*)destination + 0x3A) = saved;
    *(u32*)((u8*)destination + 8) = 0;
    *(u32*)((u8*)destination + 4) = 0;
    *(u16*)((u8*)destination + 0x3E) = 0;
    *(u16*)((u8*)destination + 0x3C) = 0;
    *(s16*)((u8*)destination + 0x2C) = -(width >> 1);
    *(s16*)((u8*)destination + 0x2E) = -(height >> 1);
}
