#include "types.h"

typedef struct AudioBankSource {
    s32 slot;
    s32 resource;
    u16 first;
    u16 second;
} AudioBankSource;

typedef struct AudioBankRecord {
    u8 *data;
    u8 *metadata;
    u32 first;
    u32 second;
} AudioBankRecord;

extern s32 D_80085028;
extern s16 D_80087AAE;
extern AudioBankSource *D_80074680[];
extern u16 D_80085D42;
extern AudioBankRecord D_80087B70[];
extern u8 *memory_pool_prepare(u16 owner, s32 resource);

void audio_bank_records_load(s16 bank) {
    AudioBankSource *source;
    s32 i;
    s32 slot;
    u8 *buffer;
    u32 length;

    D_80087AAE = bank;
    source = D_80074680[bank];
    if (D_80085028 == 1) {
        for (i = 0; source[i].slot != -1; i++) {
            slot = source[i].slot;
            buffer = memory_pool_prepare(D_80085D42, source[i].resource);
            length = buffer[1];
            length <<= 8;
            length |= buffer[0];
            D_80087B70[slot].data = buffer + 4;
            if (length != 0) {
                D_80087B70[slot].metadata = buffer + (length + 4);
            }
            D_80087B70[slot].first = source[i].first;
            D_80087B70[slot].second = source[i].second;
        }
    }
}
