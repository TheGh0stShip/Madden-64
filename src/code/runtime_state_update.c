#include "types.h"

typedef struct {
    u8 data[0x68];
} PfsC8;

extern void func_80032A4C(void *, s32);
extern void func_80032A80(void);
extern void func_80032ABC(void);
extern void osCreateMesgQueue(void *, void *, s32);
extern s32 osMotorStop(PfsC8 *);
extern s32 osMotorInit(void *, PfsC8 *, s32);

extern s8 D_80086DE4[];
extern PfsC8 D_80086F60[];
extern u8 D_800895AC[];
extern u8 D_8008B288[];
extern u32 D_8008B660[];

u32 runtime_state_update(s16 controller) {
    func_80032A80();
    osCreateMesgQueue(D_8008B288, D_800895AC, 1);
    func_80032A4C(D_8008B288, 0);
    if ((D_8008B660[D_80086DE4[controller]] & 3) && (D_8008B660[D_80086DE4[controller]] & 2)) {
        osMotorStop(&D_80086F60[D_80086DE4[controller]]);
        osMotorStop(&D_80086F60[D_80086DE4[controller]]);
        if (osMotorStop(&D_80086F60[D_80086DE4[controller]]) != 0) {
            D_8008B660[D_80086DE4[controller]] = 0;
        }
        D_8008B660[D_80086DE4[controller]] &= ~0xE;
    } else {
        D_8008B660[D_80086DE4[controller]] = 0;
        if (osMotorInit(D_8008B288, &D_80086F60[D_80086DE4[controller]], D_80086DE4[controller]) == 0) {
            D_8008B660[D_80086DE4[controller]] = 1;
        }
    }
    func_80032ABC();
    return D_8008B660[D_80086DE4[controller]];
}
