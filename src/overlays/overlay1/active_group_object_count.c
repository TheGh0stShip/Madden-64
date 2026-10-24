#include "types.h"

typedef struct ObjectGroup {
    u8* objects[11];
    u8 pad[44];
} ObjectGroup;

extern ObjectGroup D_80085040[];
extern s16 D_800886E0;
extern u16 D_8008B672;

s16 func_80093C28(void) {
    register s16 count __asm__("$6") = 0;
    s16 index = 0;
    s32 value = D_8008B672 >> 1;

    if (value != 0) {
        register s32 group_index __asm__("$2") = D_800886E0;
        s32 limit = value;
        register ObjectGroup* groups __asm__("$4") = D_80085040;
        ObjectGroup* group = &groups[group_index];

        do {
            if (group->objects[index][0x64] != 0) {
                count++;
            }
            index++;
        } while (index < limit);
    }

    return count;
}
