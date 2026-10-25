#include "types.h"

typedef struct RuntimeEntry {
    u32 unused;
    void* key;
    void* state;
    u8 count;
    u8 slot;
    u8 pad[2];
    u32 value;
} RuntimeEntry;

extern u8 D_800724DA;
extern RuntimeEntry* D_800724DC;
extern void func_80034F60(u8 index);

void func_80034FD8(void) {
    s32 index;

    for (index = 0; index < D_800724DA; index++) {
        if (D_800724DC[index].state == 0 && D_800724DC[index].slot != 0xFF) {
            func_80034F60(index);
        }
    }
}
