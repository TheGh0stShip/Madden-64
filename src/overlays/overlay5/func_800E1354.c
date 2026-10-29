#include "types.h"

typedef struct EntryE1354 {
    u32 magic;
    u16 kind;
} EntryE1354;

extern void* D_80085018;
extern s32 func_800E1B0C(void);
extern EntryE1354* func_800E1E04(s16 index);
extern void func_800E1E40(void);

s32 func_800E1354(void) {
    void* loaded;
    s32 success;
    s32 count;
    s32 index;
    EntryE1354* entry;

    loaded = D_80085018;
    success = 0;
    count = (s16)func_800E1B0C();
    if (count != 0) {
        index = count - 1;
        do {
            entry = func_800E1E04((s16)index);
            if (entry != 0 && entry->magic == 0x4E384D45 &&
                entry->kind == 0x3639) {
                success = 1;
                break;
            }
        } while (index-- != 0);
    }
    if (loaded == 0) {
        func_800E1E40();
    }
    return success;
}
