#include "types.h"

typedef struct {
    u8 pad00[0xA];
    u16 unkA;
    u8 padC;
    u8 unkD;
    u8 padE[0x20];
    u8 unk2E;
} Panel;

extern void *D_800721A4;
extern s32 D_8007A2D8;
extern s16 D_8007A308;
extern u16 D_8007A30C;
extern s16 D_8007A310;
extern u16 D_8007A314[];
extern s8 D_80084FA8;
extern s8 D_8008B358;
extern u8 D_80086A08[];
extern u8 D_800878F0[];
extern Panel D_800E74AC;
extern Panel D_800E7508;
extern u8 D_8006CD38[];
extern u8 D_8006CD8C[];

void func_8001ECAC(s32, s32, s32);
void func_80022304(u16, u16, u16, u16);
void func_800CDAE4(s16);
void func_800CDC4C(void);
void func_800DB220(void *, s16);
void func_800DB478(Panel *);
void func_800DF72C(void);
void overlay5_resource_mode_notify(void);
void overlay5_runtime_stack_advance(void);

void func_800CD7E8(s32 arg0, s32 arg1, s16 button) {
    s32 mode;

    switch (mode) {
    case 0:
        switch (button) {
        case 0:
            func_800DB220(D_80086A08, 2);
            break;
        case 1:
            func_800DB220(D_80086A08, 3);
            break;
        case 2:
        case 3:
            overlay5_resource_mode_notify();
            func_800CDAE4(button);
            break;
        case 8:
            if (D_8007A308 > 0) {
                D_8007A310 = 1;
                func_800DF72C();
                func_8001ECAC(D_8007A2D8, 0x24, 0);
                D_800E74AC.unk2E &= 0xFE;
                func_800DB478(&D_800E74AC);
                D_800E7508.unk2E |= 1;
                func_800DB478(&D_800E7508);
                D_800721A4 = D_8006CD8C;
            }
            break;
        case 17:
            func_800DF72C();
            overlay5_runtime_stack_advance();
            break;
        }
        break;
    case 1:
        switch (button) {
        case 0:
        case 1:
            func_800DB220(D_800878F0, button);
            break;
        case 2:
        case 3:
            func_800DB220(D_800878F0, button);
            func_800DB220(D_80086A08, button);
            break;
        case 8:
            func_800DF72C();
            func_8001ECAC(D_8007A2D8, 0x24, 6);
            func_80022304(D_80084FA8, D_8007A314[D_800E74AC.unkA + D_800E74AC.unkD], D_8008B358, D_8007A30C);
            func_800DB478(&D_800E7508);
            func_800CDC4C();
            D_8007A310 = 0;
            D_800E74AC.unk2E |= 1;
            func_800DB478(&D_800E74AC);
            D_800E7508.unk2E &= 0xFE;
            func_800DB478(&D_800E7508);
            D_800721A4 = D_8006CD38;
            break;
        case 17:
            func_800DF72C();
            func_8001ECAC(D_8007A2D8, 0x24, 6);
            D_8007A310 = 0;
            D_800E74AC.unk2E |= 1;
            func_800DB478(&D_800E74AC);
            D_800E7508.unk2E &= 0xFE;
            func_800DB478(&D_800E7508);
            D_800721A4 = D_8006CD38;
            break;
        }
        break;
    }
}
