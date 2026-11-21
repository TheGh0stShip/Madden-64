#include "types.h"

typedef struct AudioNameRecord {
    u8 name[13];
    u8 marker;
    u8 pad0E[26];
} AudioNameRecord;

extern u8 D_80002D10[];
extern AudioNameRecord *func_80037108(void *table, s32 index);

s32 audio_name_find(u8 *name, u8 *result_index) {
    AudioNameRecord *record;
    s32 found;
    u32 i;
    u32 j;
    s32 equal;

    found = 0;
    record = func_80037108(D_80002D10, 0);
    for (i = 0; i < 24; i++) {
        if (record[i].marker != 0xFF) {
            equal = 1;
            for (j = 0; j < 12; j++) {
                if (record[i].name[j] != name[j]) {
                    equal = 0;
                    break;
                }
                if (record[i].name[j] == 0) {
                    break;
                }
            }
            if (equal == 1) {
                found = 1;
                if (result_index != 0) {
                    *result_index = i;
                }
                break;
            }
        }
    }
    return found;
}
