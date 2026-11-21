#include "types.h"

typedef struct {
    u8 slot;
    u8 value;
} LineupEntry;

typedef struct {
    u8 pad00[0xE];
    u16 initialized;
    s16 timers[21];
    s16 unk3A;
    u8 pad3C[0x4B - 0x3C];
    u8 lineup;
    u8 pad4C[0x50 - 0x4C];
    u8 unk50[5];
    u8 unk55[5];
    u8 pad5A[2];
    u8 unk5C[21];
} State;

extern State *D_800895EC;
extern LineupEntry *D_800C3684[];
extern u16 func_80031A1C(u16);

void func_800BA6F0(void) {
    u16 i;
    u16 total = 0;
    u16 share;

    if (D_800895EC->initialized == 0) {
        D_800895EC->initialized = 1;
        for (i = 0; i < 21; i++) {
            D_800895EC->timers[i] = 0;
            D_800895EC->unk5C[i] = 0;
        }
        D_800895EC->timers[0] = -1;
        D_800895EC->timers[1] = -1;
        for (i = 0; i < 5; i++) {
            D_800895EC->unk55[i] = D_800C3684[D_800895EC->lineup][i].value;
            if (!(D_800C3684[D_800895EC->lineup][i].slot & 0x80)) {
                total += D_800C3684[D_800895EC->lineup][i].value;
            } else {
                total += D_800C3684[D_800895EC->lineup][i].value >> 1;
            }
            D_800895EC->timers[D_800C3684[D_800895EC->lineup][i].slot & 0x7F] = -1;
            if (!(D_800C3684[D_800895EC->lineup][i].slot & 0x80)) {
                D_800895EC->unk5C[D_800C3684[D_800895EC->lineup][i].slot & 0x7F] = i;
            }
            D_800895EC->unk50[i] = 40;
        }
        for (i = 0; i < 21; i++) {
            if (D_800895EC->timers[i] != -1) {
                if (i == 4) {
                    D_800895EC->timers[4] = func_80031A1C(30) + 50;
                } else {
                    D_800895EC->timers[i] = func_80031A1C(30) + 10;
                }
            }
        }
        D_800895EC->timers[16] = func_80031A1C(30) + 50;
        share = total / 20;
        total -= share;
        D_800895EC->unk3A = total + func_80031A1C(share);
    }
}
