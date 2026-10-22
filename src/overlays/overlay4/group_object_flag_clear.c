#include "types.h"

typedef struct ObjectGroup {
    u8* objects[11];
    u8 pad[44];
} ObjectGroup;

extern s16 D_800886E0;
extern ObjectGroup D_80085040[];

void func_800DDDAC(void) {
    s32 index = 0;
    ObjectGroup* group = D_80085040;

    group += D_800886E0;

    do {
        u8* object = group->objects[index];
        *(u16*)(object + 0x28) &= ~0x80;
        index++;
    } while (index < 11);
}
