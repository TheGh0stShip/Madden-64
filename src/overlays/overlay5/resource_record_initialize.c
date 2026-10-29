#include "types.h"

typedef struct Overlay5ResourceRecord {
    u8 pad00[4];
    void *owner;
    s16 value08;
    s16 value0A;
    u8 kind;
    u8 state0D;
    u8 pad0E[2];
    void *field10;
    void *field14;
    s16 value18;
    s16 value1A;
    u8 value1C;
    u8 value1D;
    u8 value1E;
    u8 pad1F[0xD];
    u8 value2C;
    u8 value2D;
    u8 value2E;
    u8 value2F;
    u8 value30;
    u8 value31;
    u8 pad32[6];
    void *field38;
    void *field3C;
    void *field40;
    void *field44;
    void *field48;
    void *field4C;
} Overlay5ResourceRecord;

void overlay5_resource_record_initialize(
    Overlay5ResourceRecord *record,
    u8 kind,
    s32 value,
    s32 initial
) {
    record->owner = 0;
    record->value08 = initial;
    record->value0A = 0;
    record->kind = kind;
    record->state0D = 0;
    record->field10 = 0;
    record->field14 = 0;
    record->value18 = value;
    record->value1A = 0;
    record->value1C = value;
    record->value1D = 0xFF;
    record->value1E = value;
    record->value2C = 0xFF;
    record->value2D = 0xFF;
    record->value2E = 0;
    record->value2F = 0;
    record->value30 = 0;
    record->value31 = 0;
    record->field3C = 0;
    record->field44 = 0;
    record->field40 = 0;
    record->field48 = 0;
    record->field4C = 0;
    record->field38 = 0;
}
