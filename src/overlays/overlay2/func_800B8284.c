#include "types.h"

typedef struct {
    u8 pad00[0x2C];
    s32 unk_2C;
    s32 unk_30;
    u8 pad34[0x10];
    s32 unk_44;
    s32 unk_48;
} SetupState;

typedef struct {
    u8 pad00[0x18];
    s32 unk_18;
    s32 unk_1C;
    s32 unk_20;
    u8 pad24[0x54];
    s32 unk_78;
} SetupScreen;

typedef struct {
    u8 pad00[0x60];
    u8 unk_60;
    u8 unk_61;
} PlayerInfo;

typedef struct {
    s32 unk_00;
    s16 unk_04;
    s32 unk_08;
    void (*unk_0C)(void);
} SetupEntry;

typedef struct {
    SetupEntry *unk_00;
    SetupEntry *unk_04;
} SetupList;

typedef struct {
    s32 unk_00;
    s32 unk_04;
    u8 pad08[8];
    s32 unk_10;
    s32 unk_14;
} SetupDefaults;

extern SetupDefaults D_800892E0;
extern s32 D_800BDF40[];
extern SetupList D_800BF210;
extern s16 D_800C48B6;
extern s16 D_800C4EE8;
extern s16 D_800C5020[];
extern s16 D_800C5030[];
extern s16 D_800C5040[];
extern s16 D_800C5050[];
extern s16 D_800C5070[];
extern SetupEntry *D_800C5080;
extern s16 D_800C5088[];
extern s16 D_800C5098;
extern u8 D_800C509E[];
extern s16 D_800C5D48[];
extern SetupState *func_800DD634(void);
extern void func_80016FE4(s32 value);
extern SetupEntry *func_80032E00(s32 zero, s32 size);
extern PlayerInfo *func_8003A7B8(u16 index);
extern s32 func_8008DF68(s16 id);
extern void func_800D5C1C(s32 id, SetupScreen *screen, void *list, SetupEntry *entries);
extern void func_800B8B30(void);

void func_800B8284(void *arg0)
{
    SetupScreen *screen;
    SetupState *state;
    PlayerInfo *info;
    s16 i;
    s16 count0;
    s16 count1;
    s16 count2;
    s16 count3;
    s16 count4;
    s16 count5;

    state = func_800DD634();
    state->unk_44 = D_800892E0.unk_10;
    state->unk_48 = D_800892E0.unk_14;
    state->unk_2C = D_800892E0.unk_00;
    state->unk_30 = D_800892E0.unk_04;
    count5 = 0;
    count4 = 0;
    func_80016FE4(state->unk_2C);
    count3 = 0;
    count2 = 0;
    func_80016FE4(state->unk_30);
    count1 = 0;
    count0 = 0;
    func_80016FE4(state->unk_44);
    func_80016FE4(state->unk_48);
    D_800C5098 = 0;
    D_800C4EE8 = 0;
    func_800DD634();
    screen = arg0;
    screen->unk_18 = 0x5F0;
    screen->unk_1C = 0;
    screen->unk_20 = 0xFA;
    D_800C5080 = func_80032E00(0, 0x50);
    for (i = 0; i < 30; i++) {
        D_800C509E[i] = i;
        info = func_8003A7B8(i);
        switch (info->unk_60) {
        case 1:
            switch (info->unk_61) {
            case 0:
                D_800C5030[count0] = i;
                count0++;
                break;
            case 1:
                D_800C5020[count1] = i;
                count1++;
                break;
            case 2:
                D_800C5070[count2] = i;
                count2++;
                break;
            }
            break;
        case 0:
            switch (info->unk_61) {
            case 0:
                D_800C5050[count3] = i;
                count3++;
                break;
            case 1:
                D_800C5040[count4] = i;
                count4++;
                break;
            case 2:
                D_800C5088[count5] = i;
                count5++;
                break;
            }
            break;
        }
    }
    D_800C48B6 = 0;
    for (i = 0; i < 5; i++) {
        D_800C5080[i].unk_00 = func_8008DF68(D_800C5030[i]);
        D_800C5080[i].unk_04 = 0;
        D_800C5080[i].unk_08 = 0;
        D_800C5080[i].unk_0C = func_800B8B30;
        D_800C5D48[i] = D_800C5030[i];
    }
    D_800BF210.unk_00 = D_800C5080;
    D_800BF210.unk_04 = D_800C5080;
    func_800D5C1C(0x5F8, screen, (u8 *)&D_800BF210 - 0x10, D_800C5080);
    screen->unk_78 = D_800BDF40[D_800C48B6];
}
