#include "types.h"

typedef void (*DisplayCallback)(void* owner);

typedef struct DisplayInterface {
    DisplayCallback callback;
    s32 value;
} DisplayInterface;

typedef struct DisplayOwner {
    u8 pad0[0x1A8];
    DisplayInterface* primary;
    u8 pad1AC[4];
    DisplayInterface* output;
    u8 pad1B4[4];
    DisplayInterface* secondary;
} DisplayOwner;

extern void func_800564B0(DisplayOwner* owner);
extern void func_800566DC(DisplayOwner* owner);

void func_80056808(DisplayOwner* owner) {
    func_800564B0(owner);
    func_800566DC(owner);
    owner->secondary->callback(owner);
    owner->primary->callback(owner);
    owner->output->callback = (DisplayCallback)owner->primary->value;
}
