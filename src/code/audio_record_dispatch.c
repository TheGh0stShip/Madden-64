#include "types.h"

typedef struct AudioRecord {
    s32 marker;
    s32 value;
    u32 field8;
} AudioRecord;

extern s32 D_80085028;
extern s16 D_80087AAE;
extern AudioRecord* D_80074680[];
extern u16 D_80085D42;
extern void func_80035F88(u16 selector, s32 value);

void func_8003D24C(s16 index) {
    s32 state = D_80085028;
    AudioRecord* start;
    AudioRecord* record;
    s32 terminator;

    D_80087AAE = index;
    start = D_80074680[index];
    if (state == 1 && start->marker != -1) {
        terminator = -1;
        record = start;
        do {
            func_80035F88(D_80085D42, record->value);
            record++;
        } while (record->marker != terminator);
    }
}
