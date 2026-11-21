#include "types.h"

typedef struct ResourceRecord {
    u16 key;
    u8 pad02[6];
    u32 mode;
    u8 disabled;
    u8 pad0D[3];
    u32 priority;
} ResourceRecord;

extern u8 D_800724DA;
extern ResourceRecord *D_800724DC;

s16 func_80034BB8(s32 value)
{
    s16 selected = -1;
    u32 best_priority = -1;
    u16 i;

    for (i = 0; i < D_800724DA; i++) {
        if (value < D_800724DC[i].key) {
            value = D_800724DC[i].key;
            break;
        }
    }
    for (i = 0; i < D_800724DA; i++) {
        if ((D_800724DC[i].mode == 2 || D_800724DC[i].mode == 0) &&
            D_800724DC[i].disabled == 0 && value == D_800724DC[i].key &&
            D_800724DC[i].priority < best_priority) {
            best_priority = D_800724DC[i].priority;
            selected = i;
        }
    }
    return selected;
}
