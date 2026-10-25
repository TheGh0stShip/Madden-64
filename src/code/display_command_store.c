#include "types.h"

typedef void (*DisplayCallback)(void);

typedef struct DisplayInterface {
    DisplayCallback callback;
    u8 pad4[0x10];
    s32 command;
    s32 value;
} DisplayInterface;

typedef struct DisplayCommandTable {
    u8 pad0[0xC];
    s32 special;
    s32 values[20];
} DisplayCommandTable;

typedef struct DisplayOwner {
    DisplayInterface* interface;
    u8 pad4[0x1B0];
    DisplayCommandTable* commands;
} DisplayOwner;

void func_80054F10(DisplayOwner* owner, s32 command, s32 value) {
    if (command == 0xFE) {
        owner->commands->special = value;
    } else if ((u32)(command - 0xE0) < 16) {
        owner->commands->values[command - 0xE0] = value;
    } else {
        owner->interface->command = 0x43;
        owner->interface->value = command;
        owner->interface->callback();
    }
}
