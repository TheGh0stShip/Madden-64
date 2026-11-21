#include "types.h"

typedef struct AudioFrameRecord {
    u8 unk_00[0xD];
    u8 unk_0D;
    u8 unk_0E[0x1A];
} AudioFrameRecord;

extern AudioFrameRecord *D_8007343C;

u16 func_8003A378(AudioFrameRecord *record) {
    u16 i;

    for (i = 0; i < 24; i++) {
        if (D_8007343C[i].unk_0D == 0xFF) {
            D_8007343C[i] = *record;
            return i | 0x8000;
        }
    }
    return 0;
}
