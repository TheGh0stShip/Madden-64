#include "types.h"

typedef struct RuntimeMenuConfig {
    void* first;
    u8 pad4[8];
    void* second;
    void* third;
    u8 pad14[4];
    s32 enabled;
} RuntimeMenuConfig;

extern void func_800D67B8(RuntimeMenuConfig* config);
extern s16 func_800D6454(RuntimeMenuConfig* config);
extern void func_80021EE0(u16 value);
extern u8 D_8006C000[];
extern u8 D_8006BCA4[];
extern u8 D_8006BCA8[];
extern s8 D_80084FA8;

s32 func_800CC6E8(void) {
    RuntimeMenuConfig config;

    func_800D67B8(&config);
    config.first = D_8006C000;
    config.second = D_8006BCA4;
    config.third = D_8006BCA8;
    config.enabled = 1;
    if (func_800D6454(&config) == 0) {
        func_80021EE0((u16)D_80084FA8);
    }
    return 25;
}
