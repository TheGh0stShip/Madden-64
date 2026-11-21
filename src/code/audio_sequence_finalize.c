#include "types.h"

typedef struct {
    u16 unk_00;
    u8 unk_02;
    u8 unk_03;
} AudioRecord;

typedef struct {
    u16 count;
    AudioRecord records[1];
} AudioRecordList;

typedef struct {
    AudioRecord records[2131];
} AudioRecordBank;

s32 audio_record_field_get(AudioRecord *, u16);
u8 func_80024B90(u16);
void func_80024E9C(void);
void gameplay_state_update(void);
extern AudioRecordList *D_800740C4;
extern s16 D_800740C8;
extern AudioRecordBank D_80082D84[];

s32 audio_sequence_finalize(u16 arg0, u16 arg1, u16 arg2) {
    s32 result;
    u16 found;
    u16 i;

    result = 11;
    found = 0;
    if (D_800740C8 == 1) {
        gameplay_state_update();
        for (i = 0; i < D_800740C4->count; i++) {
            if (arg0 == func_80024B90(D_800740C4->records[i].unk_00)) {
                if (found == arg1) {
                    result = audio_record_field_get(&D_800740C4->records[i], arg2);
                }
                found++;
            }
        }
        func_80024E9C();
        return result;
    }
    for (i = 0; i < 4; i++) {
        if (D_80082D84[arg0].records[i].unk_00 != 0xFFFF && D_80082D84[arg0].records[i].unk_03 != 0x80) {
            if (found == arg1) {
                AudioRecord *bank = D_80082D84[arg0].records;
                result = audio_record_field_get(&bank[i], arg2);
            }
            found++;
        }
    }
    return result;
}
