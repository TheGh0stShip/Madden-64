#include "types.h"

typedef struct GridOwnedRecord {
    void *definition;
    u8 pad04[0xE];
    u16 value12;
    u8 pad14[4];
    u32 definition_value;
    u8 pad1C[0xC];
    u32 handle;
    u8 pad2C[0x2C];
} GridOwnedRecord;

typedef struct GridContext {
    u8 pad00[8];
    GridOwnedRecord *record;
    u8 pad0C[0x10];
    u32 value1C;
    u32 value20;
    u32 value24;
} GridContext;

typedef struct GridDefinition {
    void *definition;
    void *argument;
    u16 value08;
    u8 pad0A[2];
    u32 value0C;
    u32 value10;
    u32 value14;
} GridDefinition;

extern void *D_800748E8;
extern u8 D_80074A60;
extern void func_8002E58C(void *destination, s32 value, u32 size);
extern void func_80034388(GridContext *context, void *argument);
extern void func_80033B20(GridContext *context, s32 enabled);
extern u32 func_80033298(void *context);

void grid_record_initialize(GridContext *context, GridDefinition *definition)
{
    register GridContext *saved_context __asm__("$16") = context;
    register GridDefinition *saved_definition __asm__("$17") = definition;
    register GridOwnedRecord *record __asm__("$18");
    register void *record_definition __asm__("$2");

    __asm__("" : "=r"(saved_context), "=r"(saved_definition)
            : "0"(saved_context), "1"(saved_definition));
    record = saved_context->record;

    saved_context->value1C = saved_definition->value0C;
    saved_context->value20 = saved_definition->value10;
    saved_context->value24 = saved_definition->value14;
    saved_context->record = record;
    func_8002E58C(record, 0, 0x58);
    record_definition = saved_definition->definition;
    __asm__("" : "=r"(record_definition) : "0"(record_definition));
    record->definition = record_definition;
    record->definition_value = *(u32 *)((u8 *)record_definition + 0xC);
    record->value12 = saved_definition->value08;
    func_80034388(saved_context, saved_definition->argument);
    func_80033B20(saved_context, 1);
    record->handle = func_80033298(D_800748E8);
    D_80074A60++;
}
