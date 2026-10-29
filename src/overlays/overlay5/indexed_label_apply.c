#include "types.h"

typedef struct IndexedLabelBuffer {
    u8 pad0[0x10A];
    s16 values[0x17];
} IndexedLabelBuffer;

extern char D_80002234[];
extern char D_800C2EE0[];
extern void func_800E2068(const char* name, IndexedLabelBuffer* buffer, s32 mode);
extern void* func_8003AA28(u16 value);
extern void func_8002E65C(void* object, void* value);

void func_800D8B74(u16 index, void* object) {
    IndexedLabelBuffer buffer;
    s16 value;

    func_800E2068(D_80002234, &buffer, 0);
    value = buffer.values[index];
    if (value & 0x8000) {
        func_8002E65C(object, D_800C2EE0);
    } else {
        func_8002E65C(object, func_8003AA28((u16)value));
    }
}
