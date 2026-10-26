#include "types.h"

typedef struct AudioAllocatedSlot {
    s32 active;
    s32 owner;
    s32 state;
    s32 handle;
    s32 value;
    s32 unused;
} AudioAllocatedSlot;

extern AudioAllocatedSlot D_8008B078[];
extern void func_80036540(s32 value);
extern s32 func_800365AC(void *context, s32 value);

u16 audio_slot_allocate(void *context, s32 owner, s32 value)
{
    u16 index;

    func_80036540(0);
    index = 0;
    while (index < 16 && D_8008B078[index].active != 0) {
        index++;
    }

    D_8008B078[index].active = -1;
    D_8008B078[index].handle = func_800365AC(context, 1);
    D_8008B078[index].value = value;
    D_8008B078[index].owner = owner;
    D_8008B078[index].state = 0;

    return index | 0x4000;
}
