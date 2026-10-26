#include "types.h"

typedef struct AudioStreamRecord {
    u8 pad00[0x1C];
    u8 primary;
    u8 pad1D;
    u8 channel;
    u8 pad1F;
    u8 secondary;
} AudioStreamRecord;

extern s16 D_800886E0;
extern u16 func_80022B3C(u8 channel, u16 value, u16 type);
extern s16 func_8003BEE4(u8 primary, u8 secondary);
extern s16 func_8003BF54(u8 channel);
extern s16 func_8003BF9C(AudioStreamRecord *record, u16 value, u16 type,
                        s16 amount);

s16 audio_stream_prepare(AudioStreamRecord *record, u32 value, u32 type)
{
    register AudioStreamRecord *saved_record __asm__("$17") = record;
    register u32 saved_value __asm__("$19") = value;
    register u32 saved_type __asm__("$18");
    register u16 amount __asm__("$16");
    register u32 type_temp __asm__("$2");
    register s32 calculation __asm__("$2");
    s32 status;

    type_temp = type;
    saved_type = type_temp;
    amount = func_80022B3C(saved_record->channel, saved_value,
                           type_temp + 0x15);
    if ((u16)saved_type == 3) {
        goto type_three;
    }
    if ((u16)saved_type != 4) {
        goto type_done;
    }
    if (func_8003BEE4(saved_record->primary,
                      saved_record->secondary) == 0) {
        calculation = (s16)amount;
        __asm__("" : "=r"(calculation) : "0"(calculation));
        amount = calculation / 4;
    }
    goto type_done;

type_three:
    if (func_8003BEE4(saved_record->primary,
                      saved_record->secondary) == 0) {
        calculation = (s16)amount;
        __asm__("" : "=r"(calculation) : "0"(calculation));
        amount -= calculation / 4;
    }

type_done:
    status = func_8003BF54(saved_record->channel ^ 1);
    if (status == 0) {
        goto status_zero;
    }
    if (status == 2) {
        goto status_two;
    }
    goto dispatch;

status_zero:
    if (saved_record->channel == D_800886E0) {
        calculation = (s16)amount * 2;
        amount = calculation / 3;
    }
    goto dispatch;

status_two:
    calculation = (s16)amount * 2;
    amount = calculation / 3 + 0x55;

dispatch:
    return func_8003BF9C(saved_record, saved_value, saved_type, amount);
}
