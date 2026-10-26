#include "types.h"

typedef struct MenuGridSource {
    u8 pad00[0xD];
    u8 value0D;
    u8 pad0E;
    u8 value0F;
    u8 value10;
    u8 pad11[0x10];
    u8 value21;
    u8 pad22[6];
} MenuGridSource;

typedef struct MenuGridDispatch {
    MenuGridSource *source;
    u8 value04;
    u8 index05;
    u8 value06;
    u8 value07;
    u8 value08;
} MenuGridDispatch;

typedef struct MenuGridSlot {
    u8 pad00[0x24];
    void *context;
} MenuGridSlot;

extern u8 D_80080D6A;
extern u8 D_80085040;
extern void func_800442F4(void *context, MenuGridDispatch *dispatch);

void menu_grid_record_dispatch(u16 index, u16 slot, u16 column)
{
    MenuGridDispatch dispatch;
    register u32 saved_index __asm__("$7") = (u16)index;
    register MenuGridSource *source __asm__("$2");
    register u32 source_part __asm__("$3");
    register u32 slot_base __asm__("$3");
    register u32 value07 __asm__("$3");
    register u32 value08 __asm__("$2");
    register u32 scaled_slot __asm__("$5");
    MenuGridSlot *selected;

    source = (MenuGridSource *)(saved_index * 8524);
    __asm__("" : "=r"(source) : "0"(source));
    source_part = (u32)&D_80080D6A;
    __asm__("" : "=r"(source_part) : "0"(source_part));
    source = (MenuGridSource *)((u32)source + source_part);
    source_part = (u16)column * 40;
    source = (MenuGridSource *)((u32)source + source_part);

    dispatch.source = source;
    dispatch.value04 = source->value21;
    dispatch.index05 = index;
    dispatch.value06 = source->value10;
    value07 = source->value0F;
    scaled_slot = (u16)slot;
    __asm__("" : "=r"(scaled_slot) : "0"(scaled_slot), "r"(value07));
    dispatch.value07 = value07;
    value08 = source->value0D;
    __asm__("" : "=r"(scaled_slot)
            : "0"(scaled_slot), "r"(value08));
    scaled_slot <<= 2;
    slot_base = (u32)&D_80085040;
    __asm__("" : "=r"(slot_base) : "0"(slot_base));
    dispatch.value08 = value08;
    selected = *(MenuGridSlot **)(scaled_slot
               + (saved_index * 88 + slot_base));
    func_800442F4(selected->context, &dispatch);
}
