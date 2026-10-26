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
extern u8 D_80087B70[];
extern u8 *func_80035D7C(u16 owner, s32 resource);

void audio_bank_records_load(s32 bank)
{
    register s32 bank_arg __asm__("$4") = bank;
    register AudioBankSource *source __asm__("$16");
    register AudioBankSource *cursor __asm__("$17");
    register s32 sentinel __asm__("$18");

    s32 state = D_80085028;
    __asm__("" : "=r"(state) : "0"(state));

    D_80087AAE = bank_arg;
    bank_arg <<= 16;
    bank_arg >>= 14;
    source = *(AudioBankSource **)((u8 *)D_80074680 + bank_arg);
    if (state != 1 || source->slot == -1) {
        return;
    }
    sentinel = -1;
    cursor = source;
    do {
        register s32 resource __asm__("$5") = cursor->resource;
        register s32 offset __asm__("$16") = cursor->slot;
        u8 *buffer = func_80035D7C(D_80085D42, resource);
        register u32 length __asm__("$4") = buffer[1];
        register u32 low __asm__("$3") = buffer[0];

        offset <<= 4;
        *(u8 **)(D_80087B70 + offset) = buffer + 4;
        length = (length << 8) | low;
        if (length != 0) {
            register u32 data_offset __asm__("$2") = length + 4;
            *(u8 **)(D_80087B70 + offset + 4) = buffer + data_offset;
        }
        *(u32 *)(D_80087B70 + offset + 8) = cursor->first;
        *(u32 *)(D_80087B70 + offset + 12) = cursor->second;
        cursor++;
    } while (cursor->slot != sentinel);
}
