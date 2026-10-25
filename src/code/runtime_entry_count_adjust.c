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

void func_80034E58(void* key, u8 increase) {
    u32 index;

    for (index = 0; index < D_800724DA; index++) {
        if (D_800724DC[index].key == key) {
            if (increase != 0) {
                D_800724DC[index].count++;
            } else {
                D_800724DC[index].count--;
            }
            return;
        }
    }
}
