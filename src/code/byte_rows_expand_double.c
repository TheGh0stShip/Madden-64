#include "types.h"

typedef struct ExpansionContext {
    u8 pad0[0x70];
    u32 row_size;
    u8 pad74[0xC0];
    s32 row_count;
} ExpansionContext;

void func_8005F15C(ExpansionContext* context, s32 unused,
                   u8** sources, u8*** destination_rows) {
    register u8** source_rows __asm__("$6") = sources;
    register u8** destinations __asm__("$7") = *destination_rows;
    s32 row;

    for (row = 0; row < context->row_count; row++) {
        u8* destination = *destinations;
        u8* end = destination + context->row_size;
        u8* source = *source_rows;

        while (destination < end) {
            u8 value = *source++;
            *destination++ = value;
            *destination++ = value;
        }
        destinations++;
        source_rows++;
    }
}
