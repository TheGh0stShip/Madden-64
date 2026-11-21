#include "types.h"

typedef struct {
    s16 unk_0;
    s16 unk_2;
} Info;

typedef struct {
    Info *unk_0;
    u8 pad4[0x2148];
} Team;

void conditional_runtime_cleanup(void);
void func_800209BC(void);
void func_800293CC(void);
void func_800297A4(void);
void func_800416A4(s32);
void func_8009C9E8(void);
void func_800A1844(s32);
void func_800A365C(s32);
void func_800AD404(void);
void func_800AE8E4(void);
void func_800B1F84(void);
void func_800BE980(void);
void func_800C1BE0(void);
void func_800C5F70(void);
void func_800C5F80(void);
void func_800D3818(s32);
void func_800D5A40(void);
void func_800E20C0(void);
void status_overlay_enable(void);
extern s16 D_8006B7AA;
extern s16 D_8006B7AC;
extern s16 D_8006B7BC;
extern s16 D_8006B7BE;
extern s32 D_80080C10;
extern Team D_80082DB4[];
extern s32 D_80084F34;
extern s32 D_80085040[][22];
extern s16 D_800857F0;
extern u8 D_80086DDC[];
extern s16 D_800876DC;
extern s16 D_80087944;
extern s16 D_80087AAC;
typedef struct {
    u8 unk_0;
    u8 pad1[0x3];
    s16 unk_4;
    u8 pad6[0x6];
    s32 unk_C;
} State;

extern State D_80087AB0;
extern s16 D_800886E0;
extern s16 D_80088AE4;
extern u8 D_80088AF3;
extern s16 D_80089320;
extern u8 D_8008AF70;

void func_8008F624(void) {
    func_800C5F70();
    D_80087944 = 0;
    if (D_800857F0 != 0) {
        return;
    }
    func_800A1844(1);
    func_800AD404();
    conditional_runtime_cleanup();
    func_800AE8E4();
    D_80087AB0.unk_0 = 3;
    D_80087AB0.unk_C = D_80085040[D_80088AE4][D_80082DB4[D_80088AE4].unk_0->unk_2];
    D_80087AB0.unk_4 = D_80084F34 >> 16;
    func_800C5F80();
    func_800BE980();
    D_80086DDC[D_80088AE4] = 2;
    D_80086DDC[D_800886E0] = 2;
    D_8008AF70 = 0;
    if (D_80089320 != -1) {
        func_800209BC();
        func_800D3818(D_80085040[D_80088AE4][D_80082DB4[D_80088AE4].unk_0->unk_2]);
        if (!(D_80080C10 & 0x200)) {
            status_overlay_enable();
        }
        func_800416A4(8);
    } else if ((D_800876DC != 2 && D_800876DC != 4) || D_80087AAC >= 0x79) {
        if (!(D_80080C10 & 0x200)) {
            status_overlay_enable();
        }
    }
    func_8009C9E8();
    func_800C1BE0();
    func_800D5A40();
    D_80080C10 = (D_80080C10 & 0x3BE3F7FF) | 0x4000;
    if (D_80088AF3 != D_80088AE4 && D_80089320 > 0) {
        func_800293CC();
    }
    func_800297A4();
    func_800E20C0();
    if (!(D_80080C10 & 0x100)) {
        func_800A365C(1);
    }
    func_800B1F84();
    if (D_80089320 == -1) {
        D_8006B7AA = -1;
        D_8006B7AC = -1;
        D_8006B7BC = -1;
        D_8006B7BE = -1;
    }
}
