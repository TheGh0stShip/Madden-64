#include "types.h"

typedef struct Overlay5Field10 {
    u8 pad00[0x10];
    s32 value;
} Overlay5Field10;

void overlay5_field_10_store(Overlay5Field10 *record, s32 value) {
    record->value = value;
}
