#include "types.h"

typedef struct DispatchEntry {
    u8 data[8];
} DispatchEntry;

extern DispatchEntry D_800716C8[];
extern void func_8001F488(u8 type, void* value, DispatchEntry* entry);

void func_8001F5A4(u8 type, void* value, s32 index) {
    func_8001F488(type, value, &D_800716C8[index]);
}
