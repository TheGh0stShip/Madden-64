#include "types.h"

typedef struct TeamEntry {
    s8 flag;
    u8 pad[1991];
} TeamEntry;

extern TeamEntry D_800785A5[];

void func_8001F81C(u8 index, s8 value) {
    D_800785A5[index].flag = value;
}
