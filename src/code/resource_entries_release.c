#include "types.h"

typedef struct ResourceEntry {
    u8 pad0[4];
    void* allocation;
    u8 pad8[0xC];
} ResourceEntry;

extern u8 D_800724DA;
extern u8 D_800724DB;
extern ResourceEntry* D_800724DC;
extern void func_80032F3C(s32 type, void* allocation);

void func_80034978(void) {
    u32 index;

    for (index = 0; index < D_800724DA; index++) {
        func_80032F3C(0, D_800724DC[index].allocation);
    }
    D_800724DA = 0;
    D_800724DB = 0;
    D_800724DC = 0;
}
