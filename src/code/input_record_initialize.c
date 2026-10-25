#include "types.h"

typedef struct InputRecord {
    u8 bytes[12];
} InputRecord;

extern s16 D_80085D32;
extern s16 D_80085D30;
extern s16 D_8008B284;
extern void func_80032B78(s16 index, InputRecord* record);

void func_80032B00(InputRecord* records) {
    s16 index = 0;

    do {
        func_80032B78(index, &records[index]);
        index++;
    } while (index <= 0);

    D_80085D32 = 0;
    D_80085D30 = 0;
    D_8008B284 = 0;
}
