#include "types.h"

typedef struct ObjectCallbacks {
    void (*reset)(void *object);
    void (*set_enabled)(void *object, s32 enabled);
    u8 pad08[0x0C];
    s32 mode;
    s32 argument;
} ObjectCallbacks;

typedef struct CycleEntry {
    u8 pad00[0x14];
    u32 first;
    u32 second;
} CycleEntry;

extern void func_80058F2C(void *object, void *value, void *slot);

void func_80058D78(void *object)
{
    register u8 *state __asm__("$16") = object;
    register u8 *cycle __asm__("$20");
    register s32 index __asm__("$19");
    register s32 command __asm__("$23");
    register u8 *cycle_slot __asm__("$22");
    register u8 *entry_slot __asm__("$21");
    register u32 first __asm__("$17");
    register u32 second __asm__("$18");
    volatile u32 frame_pad[2];

    __asm__("" : "=r"(state) : "0"(state));
    cycle = *(u8 **)(state + 0x1B8);
    if (*(u32 *)(state + 0x18C) != 0 ||
        *(u32 *)(state + 0x190) != 0x3F ||
        *(u32 *)(state + 0x194) != 0 ||
        *(u32 *)(state + 0x198) != 0) {
        (*(ObjectCallbacks **)state)->mode = 0x76;
        (*(ObjectCallbacks **)state)->set_enabled(state, -1);
    }

    index = 0;
    if (*(s32 *)(state + 0x144) > 0) {
        command = 0x31;
        cycle_slot = cycle;
        entry_slot = state;
        do {
            CycleEntry *entry = *(CycleEntry **)(entry_slot + 0x148);

            first = entry->first;
            second = entry->second;
            if (first >= 4 || *(void **)(state + 0xB4 + first * 4) == 0) {
                (*(ObjectCallbacks **)state)->mode = command;
                (*(ObjectCallbacks **)state)->argument = first;
                (*(ObjectCallbacks **)state)->reset(state);
            }
            if (second >= 4 || *(void **)(state + 0xC4 + second * 4) == 0) {
                (*(ObjectCallbacks **)state)->mode = command;
                (*(ObjectCallbacks **)state)->argument = second;
                (*(ObjectCallbacks **)state)->reset(state);
            }
            func_80058F2C(state, *(void **)(state + 0xB4 + first * 4),
                          cycle + 0x28 + first * 4);
            func_80058F2C(state, *(void **)(state + 0xC4 + second * 4),
                          cycle + 0x38 + second * 4);
            *(u32 *)(cycle_slot + 0x14) = 0;
            entry_slot += 4;
            index++;
            cycle_slot += 4;
        } while (index < *(s32 *)(state + 0x144));
    }

    *(u32 *)(cycle + 0x0C) = 0;
    *(u32 *)(cycle + 0x08) = 0;
    *(u32 *)(cycle + 0x10) = 0;
    *(u32 *)(cycle + 0x24) = *(u32 *)(state + 0x114);
}
