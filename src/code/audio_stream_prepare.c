#include "types.h"

typedef struct {
    u8 pad00[0x1C];
    u8 primary;
    u8 pad1D;
    u8 channel;
    u8 pad1F;
    u8 secondary;
} AudioStreamRecord;

extern s16 D_800886E0;
extern u16 roster_symbol_lookup(u8 channel, u16 value, u16 type);
extern s16 func_8003BEE4(u8 primary, u8 secondary);
extern s16 func_8003BF54(u8 channel);
extern s16 audio_stream_configure(AudioStreamRecord *record, u16 value, u16 type, s16 amount);

s16 audio_stream_prepare(AudioStreamRecord *record, u16 value, u16 type) {
    s16 amount = roster_symbol_lookup(record->channel, value, type + 0x15);

    switch (type) {
        case 4:
            if (func_8003BEE4(record->primary, record->secondary) == 0) {
                amount /= 4;
            }
            break;
        case 3:
            if (func_8003BEE4(record->primary, record->secondary) == 0) {
                amount -= amount / 4;
            }
            break;
    }
    switch (func_8003BF54(record->channel ^ 1)) {
        case 0:
            if (record->channel == D_800886E0) {
                amount = amount * 2 / 3;
            }
            break;
        case 2:
            amount = amount * 2 / 3 + 0x55;
            break;
    }
    return audio_stream_configure(record, value, type, amount);
}
