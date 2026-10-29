#include "types.h"

typedef struct RuntimeConfigPair {
    void* first;
    void* second;
    u8 pad8[0x18];
} RuntimeConfigPair;

extern s32 func_80029944(void);
extern void func_800DD514(s32 value);
extern void func_800D67B8(RuntimeConfigPair* config);
extern void func_800D6454(RuntimeConfigPair* config);
extern u8 D_800895E4;
extern u8 D_8006BCF8[];
extern u8 D_8006BD0C[];

s32 func_800C8DAC(void) {
    RuntimeConfigPair config;

    if ((u8)func_80029944() != 0) {
        D_800895E4 = 1;
        func_800DD514(0);
    } else {
        func_800D67B8(&config);
        config.first = D_8006BCF8;
        config.second = D_8006BD0C;
        func_800D6454(&config);
    }
    return 25;
}
