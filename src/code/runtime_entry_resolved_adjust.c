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

extern RuntimeEntry* D_800724DC;
extern u16 func_800349FC(s32 value, s16* index);

u16 func_80034ED4(s32 value, u8 increase) {
    s16 index;
    u16 result;

    result = func_800349FC(value, &index);
    if (index != -1) {
        if (increase != 0) {
            D_800724DC[index].count++;
        } else {
            D_800724DC[index].count--;
        }
    }
    return result;
}
