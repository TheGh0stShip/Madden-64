#include "types.h"

typedef struct {
    u8 pad00[0x68];
} RumblePak;

typedef struct {
    u8 pad00[0x18];
} MesgQueue;

extern MesgQueue D_8008B288;
extern void *D_800895AC;
extern s16 D_80086DA8;
extern s8 D_80086DE4[];
extern u32 D_8008B660[];
extern RumblePak D_80086F60[];
void func_80032A80(void);
void func_80032ABC(void);
void func_80032A4C(MesgQueue *, s32);
void osCreateMesgQueue(MesgQueue *, void **, s32);
s32 osMotorStop(RumblePak *);
s32 osMotorInit(MesgQueue *, RumblePak *, s32);

void runtime_callback_process(void) {
    s32 i;

    func_80032A80();
    osCreateMesgQueue(&D_8008B288, &D_800895AC, 1);
    func_80032A4C(&D_8008B288, 0);
    i = D_80086DA8;
    while (i-- != 0) {
        if ((D_8008B660[D_80086DE4[i]] & 3) && (D_8008B660[D_80086DE4[i]] & 2)) {
            osMotorStop(&D_80086F60[D_80086DE4[i]]);
            osMotorStop(&D_80086F60[D_80086DE4[i]]);
            if (osMotorStop(&D_80086F60[D_80086DE4[i]]) != 0) {
                D_8008B660[D_80086DE4[i]] = 0;
            }
            D_8008B660[D_80086DE4[i]] &= ~0xE;
        } else {
            D_8008B660[D_80086DE4[i]] = 0;
            if (osMotorInit(&D_8008B288, &D_80086F60[D_80086DE4[i]], D_80086DE4[i]) == 0) {
                D_8008B660[D_80086DE4[i]] = 1;
            }
        }
    }
    func_80032ABC();
}
