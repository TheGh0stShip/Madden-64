#include "types.h"

typedef struct AllocationList {
    u32 count;
    void* entries[1];
} AllocationList;

typedef struct Runtime {
    u8 pad0[0x14];
    s32 field14;
    s32 field18;
    u8 pad1C[0x28];
    s32 field44;
} Runtime;

typedef struct Object {
    u8 pad0[0x60];
    AllocationList* allocations;
} Object;

extern s32 D_8008931C;
extern Runtime* func_800DD634(void);
extern void func_80032F3C(s32 arena, void* allocation);
extern void func_8000D834(s32 object, s32 value);
extern void func_800D628C(Object* object);

void func_800CF9D4(Object* object) {
    Runtime* runtime = func_800DD634();
    AllocationList* allocations = object->allocations;
    u32 index = 0;

    for (index = 0; index < allocations->count; index++) {
        func_80032F3C(0, allocations->entries[index]);
    }
    func_80032F3C(0, allocations);
    func_8000D834(D_8008931C, runtime->field44);
    runtime->field14 = 0;
    runtime->field18 = 0;
    func_800D628C(object);
}
