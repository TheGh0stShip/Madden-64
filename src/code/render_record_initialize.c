#include "types.h"

typedef struct RenderRecord {
    u32 word0;
    u8 pad4[8];
    u16 seventh;
    u16 enabled_a;
    u16 enabled_b;
    u16 first_a;
    u16 second_a;
    u16 third;
    u16 fourth;
    u16 first_b;
    u16 second_b;
    u8 pad1E[0x1C];
    u16 sixth;
} RenderRecord;

void func_80017840(RenderRecord* record, u16 first, u16 second, u16 third,
                   u16 fourth, u16 sixth, u16 seventh) {
    record->word0 = 0;
    record->enabled_a = 1;
    record->enabled_b = 1;
    record->first_a = first;
    record->second_a = second;
    record->first_b = first;
    record->second_b = second;
    record->third = third;
    record->fourth = fourth;
    record->seventh = seventh;
    record->sixth = sixth;
}
