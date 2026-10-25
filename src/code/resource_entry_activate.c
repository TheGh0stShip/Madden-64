#include "types.h"

typedef struct ResourceEntry {
    u32 field0;
    void* resource;
    s32 state;
    u8 padC[8];
} ResourceEntry;

extern ResourceEntry* D_800724DC;
extern void* func_800346DC(void* resource);
extern void func_80034804(void* first, void* second);

void* func_80034F60(u8 index) {
    void* result = func_800346DC(D_800724DC[index].resource);

    func_80034804(result, result);
    D_800724DC[index].state = 2;
    return result;
}
