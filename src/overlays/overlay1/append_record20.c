#include "types.h"

typedef struct Record20 {
    u32 words[5];
} Record20;

extern s16 D_80087752;
extern Record20 D_80085D80[];

void func_800B3048(Record20* source) {
    D_80085D80[D_80087752] = *source;
    D_80087752++;
}
