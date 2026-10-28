#include "types.h"

typedef struct MenuSlotValue {
    u8 pad00[0x20];
    s32 value;
} MenuSlotValue;

typedef struct MenuSlot {
    u8 pad00[0x24];
    MenuSlotValue *state;
} MenuSlot;

typedef struct MenuSlotRow {
    MenuSlot *slots[11];
    u8 pad2C[44];
} MenuSlotRow;

extern s16 D_800886E0;
extern MenuSlotRow D_80085040[];
extern s32 D_80084F34;
extern void func_8001FA68(u32 count, MenuSlot *slot, s32 threshold,
                          s32 base);

void menu_slots_threshold_update(void)
{
    u16 index = 0;
    MenuSlotRow *rows = D_80085040;
    s32 offset = 0xA0000;

    do {
        MenuSlot *slot = rows[D_800886E0].slots[index];
        s32 base = D_80084F34;

        if (slot->state->value < base + offset) {
            func_8001FA68(11, slot, base, base);
        }
        index++;
    } while (index < 11);
}
