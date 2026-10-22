#include "types.h"

typedef struct ObjectGroup {
    u8* objects[11];
    u8 pad[44];
} ObjectGroup;

extern ObjectGroup D_80085040[];
extern s16 D_80088AE4;

void func_800C1228(u8* object) {
    u8* source;
    u8* transform;

    if (!(*(u32*)(object + 0x14) & 1)) {
        return;
    }
    source = D_80085040[D_80088AE4].objects[*(u32*)(object + 0x10)];
    transform = *(u8**)(source + 0x24);
    *(u32*)(object + 0x1C) = *(u32*)(transform + 0x1C);
    transform = *(u8**)(source + 0x24);
    *(u32*)(object + 0x20) = *(u32*)(transform + 0x20);
    *(u32*)(object + 0x24) = 0;
}
