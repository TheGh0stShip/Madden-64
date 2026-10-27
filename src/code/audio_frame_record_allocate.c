#include "types.h"

typedef struct AudioFrameRecord {
    u8 bytes[40];
} AudioFrameRecord;

extern AudioFrameRecord *D_8007343C;

u16 func_8003A378(AudioFrameRecord *input)
{
    u32 index = 0;

    do {
        AudioFrameRecord *record = &D_8007343C[(u16)index];

        if (record->bytes[13] == 0xFF) {
            __builtin_memcpy(record, input, sizeof(*record));
            return (u16)(index | 0x8000);
        }
        index++;
    } while ((u16)index < 24);

    return 0;
}
