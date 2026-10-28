#include "types.h"

typedef struct {
    u8 pad00[0xC0];
    s32 unkC0;
} Resource;

extern Resource *D_80086A2C;
extern s32 D_80086E34[25];
extern s32 D_80087784[5];
extern s8 D_80088098;

void func_8001AEA8(s32);
void func_80032F3C(s32, Resource *);
void func_8008D1EC(void);
void func_80093A20(void);
void func_800B0F38(s32);

void func_80098588(void) {
    u32 i;

    func_80093A20();
    func_8001AEA8(D_80086A2C->unkC0);
    for (i = 0; i < 25; i++) {
        D_80086E34[i] = 0;
    }
    for (i = 0; i < 5; i++) {
        D_80087784[i] = 0;
    }
    D_80088098 = 2;
    func_800B0F38(0xFF);
    func_80032F3C(0, D_80086A2C);
    D_80086A2C = 0;
    func_8008D1EC();
}
