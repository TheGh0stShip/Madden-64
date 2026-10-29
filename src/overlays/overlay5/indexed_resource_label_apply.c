#include "types.h"

typedef struct IndexedResourceTable {
    u8 pad0[0x5A];
    u16 identifier;
    u32 count;
} IndexedResourceTable;

extern u32 func_8003FA40(u16 identifier, u16 index, s32 field);
extern void func_8002E65C(void* object, void* value);
extern s32 func_8004DF94(void* object);
extern void* D_8006E458[];
extern void* D_80073DA0[];
extern u8 D_8006BFA0[];

void func_800DAB68(u16 index, void* object, IndexedResourceTable* table) {
    u32 value;
    void* target;

    if (index < table->count) {
        value = func_8003FA40(table->identifier, index, 3);
        if ((value & 0xE0) != 0xE0) {
            value = func_8003FA40(table->identifier, index, 1);
            func_8002E65C(object, (void*)value);
        } else {
            value = func_8003FA40(table->identifier, index, 4);
            func_8002E65C(object, D_8006E458[value]);
            target = (u8*)object + func_8004DF94(object);
            value = func_8003FA40(table->identifier, index, 0);
            func_8002E65C(target, D_80073DA0[value]);
        }
    } else {
        func_8002E65C(object, D_8006BFA0);
    }
}
