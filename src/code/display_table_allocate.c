#include "types.h"

typedef void* (*AllocateCallback)(void* owner, s32 clear, s32 size);
typedef void (*DisplayCallback)(void);

typedef struct Allocator {
    AllocateCallback allocate;
} Allocator;

typedef struct DisplayTable {
    DisplayCallback first;
    DisplayCallback second;
    DisplayCallback third;
    DisplayCallback fourth;
    s32 value0;
    s32 value1;
    s32 enabled;
} DisplayTable;

typedef struct DisplayOwner {
    u8 pad0[4];
    Allocator* allocator;
    u8 pad8[0x1A8];
    DisplayTable* table;
} DisplayOwner;

extern void func_8005687C(void);
extern void func_800569A0(void);
extern void func_80056808(void);
extern void func_80056868(void);

void func_80056A08(DisplayOwner* owner) {
    DisplayTable* table = owner->allocator->allocate(owner, 0, 0x1C);

    owner->table = table;
    table->first = func_8005687C;
    table->second = func_800569A0;
    table->third = func_80056808;
    table->fourth = func_80056868;
    table->value0 = 0;
    table->value1 = 0;
    table->enabled = 1;
}
