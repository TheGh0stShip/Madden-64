#include "types.h"

typedef void (*DisplayCallback)(void);

typedef struct DisplayInterface {
    DisplayCallback callback;
    u8 pad4[0x10];
    s32 command;
    s32 value;
} DisplayInterface;

typedef struct DisplayOwner {
    DisplayInterface* interface;
    u8 pad4[0xC];
    s32 state;
    u8 pad14[0x19C];
    s32* results;
} DisplayOwner;

#ifndef RANGE_BASE
#define RANGE_BASE 200
#define RANGE_COUNT 11
#define RESULT_INDEX 5
#define FUNCTION func_8005537C
#endif

s32 FUNCTION(DisplayOwner* owner) {
    if ((u32)(owner->state - RANGE_BASE) >= RANGE_COUNT) {
        owner->interface->command = 18;
        owner->interface->value = owner->state;
        owner->interface->callback();
    }
    return owner->results[RESULT_INDEX];
}
