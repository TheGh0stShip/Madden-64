#include "types.h"

typedef struct ObjectGroup {
    u8* objects[11];
    u8 pad[44];
} ObjectGroup;

extern ObjectGroup D_80085040[];

void func_8009B728(void) {
    s8 group;

    for (group = 0; group < 2; group++) {
        s8 index;
        for (index = 0; index < 11; index++) {
            u8* object = D_80085040[group].objects[index];
            u8* child = *(u8**)(object + 0x24);
            *(u32*)(child + 0x14) &= ~1;
        }
    }
}

void func_8009B7B8(void) {
    s8 group;

    for (group = 0; group < 2; group++) {
        s8 index;
        for (index = 0; index < 11; index++) {
            u8* object = D_80085040[group].objects[index];
            u8* child = *(u8**)(object + 0x24);
            *(u32*)(child + 0x14) |= 1;
        }
    }
}
