#include "types.h"

typedef void (*Callback)(void* owner);

typedef struct DisplayTable {
    Callback reset;
    u8 pad4[0xC];
    s32 value0;
    s32 value1;
    s32 enabled;
} DisplayTable;

typedef struct PrimaryInterface {
    u8 pad0[0x10];
    Callback callback;
} PrimaryInterface;

typedef struct SecondaryInterface {
    Callback callback;
} SecondaryInterface;

typedef struct DisplayOwner {
    PrimaryInterface* primary;
    u8 pad4[0x9C];
    void* active;
    u8 padA4[0x10C];
    DisplayTable* table;
    SecondaryInterface* secondary;
} DisplayOwner;

extern void func_8005687C(void* owner);

void func_800569A0(DisplayOwner* owner) {
    DisplayTable* table = owner->table;

    table->reset = func_8005687C;
    table->value0 = 0;
    table->value1 = 0;
    table->enabled = 1;
    owner->primary->callback(owner);
    owner->secondary->callback(owner);
    owner->active = 0;
}
