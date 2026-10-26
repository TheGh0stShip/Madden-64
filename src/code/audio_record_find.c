#include "types.h"

typedef struct AudioFindRecord {
    u16 id;
    u8 unused;
    u8 mode;
} AudioFindRecord;

typedef struct AudioFindTable {
    u16 count;
    AudioFindRecord records[1];
} AudioFindTable;

extern AudioFindTable *D_800740C4;
extern void func_80040214(s32 index);
extern void func_8003FF14(AudioFindRecord *record, u16 *id);
extern void func_800401D0(AudioFindRecord *record);

void audio_record_find(AudioFindRecord *record)
{
    u16 index = 0;

    if (D_800740C4->count != 0) {
        do {
            if (D_800740C4->records[index].id == record->id) {
                if (record->mode == 0x80) {
                    func_80040214((s16)index);
                } else {
                    func_8003FF14(record, &D_800740C4->records[index].id);
                }
                break;
            }
            index++;
        } while (index < D_800740C4->count);
    }

    if (index == D_800740C4->count && record->mode != 0x80) {
        func_800401D0(record);
    }
}
