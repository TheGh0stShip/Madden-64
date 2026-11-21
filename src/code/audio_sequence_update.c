#include "types.h"

typedef struct {
    void *unk_00;
    s32 unk_04;
    s32 unk_08;
    s32 unk_0C;
    s16 unk_10;
} TransitionCommand;

typedef struct {
    u16 id;
    u8 unk_02;
    u8 unk_03;
} AudioSlot;

typedef struct {
    s16 unk_0000[0xA92];
    AudioSlot slots[4];
    u16 unk_1534;
    u16 unk_1536;
    u8 unk_1538[0xC14];
} AudioGroup;

extern s16 D_800740CC;
extern s32 D_80080C10;
extern AudioGroup D_80081860[];
extern u16 D_80082D84;
extern u16 D_80084ED0;
extern void *D_80085040[][22];
extern s16 D_800876DC;
extern s8 D_800876F4;
extern s16 D_80087702;
extern s16 D_800879B0;
extern s16 D_80087AAC;
extern s8 D_80087AFC;
extern s8 D_80088484;
extern u8 D_8008B628;
extern u8 D_800ACBF4[];
extern u8 D_800ACCF4[];
extern s32 func_80031A1C(s32 range);
extern s32 func_80031964(void);
extern void func_8003F230(void *slot);
extern void func_8009BD04(s32 value);
extern void func_8009C900(s32 first, s32 second);
extern void func_8009EB14(s16);
extern s32 func_800A1B40(s32, void *);
extern void func_800AE924(TransitionCommand *command);

void audio_sequence_update(void)
{
    TransitionCommand cmd;
    u32 i;
    u32 j;
    s32 missing;
    s32 marker;

    if (D_800740CC != 0) {
        cmd.unk_00 = D_800ACCF4;
        cmd.unk_04 = D_80087AFC;
        cmd.unk_08 = D_800876F4;
        cmd.unk_0C = (s8)D_8008B628;
        if (D_80081860[D_80087AFC].slots[D_800876F4].unk_02 < 0x1E) {
            cmd.unk_10 = 0xAF;
            func_800AE924(&cmd);
            D_80088484 = 0;
        } else {
            D_80088484 = 1;
            for (j = 0; j < 11; j++) {
                if ((s8)D_8008B628 == D_80081860[D_80087AFC].unk_0000[j]) {
                    break;
                }
            }
            if (func_800A1B40(1, D_80085040[D_80087AFC][j]) == 1) {
                cmd.unk_10 = 0;
            } else {
                cmd.unk_10 = 0xAF;
            }
            func_800AE924(&cmd);
        }
        cmd.unk_00 = D_800ACBF4;
        cmd.unk_10 = 0xAF;
        cmd.unk_04 = D_80087AFC;
        cmd.unk_08 = D_800879B0;
        cmd.unk_0C = (s8)D_8008B628;
        func_800AE924(&cmd);
        if (D_80080C10 & 0x200) {
            if (D_800876DC == 2 || D_800876DC == 4) {
                if (D_80087AAC < 0x79 && D_80087AAC != 0) {
                    if (D_80081860[D_80087AFC].unk_1536 != 0) {
                        func_8009EB14(D_80087AFC);
                        D_80087702 = 1;
                    } else {
                        func_8009BD04(2);
                    }
                }
            }
            if (D_80080C10 & 0x200) {
                func_8009BD04(3);
            }
        }
        func_8009C900(0x19, 2);
    } else {
        missing = 0xFFFF;
        marker = 0xE0;
        i = 0;
        do {
            if (*(u16 *)((u32)&D_80082D84 + i) != missing && *(u8 *)((u32)&D_80082D84 + i + 3) == marker &&
                (u16)func_80031A1C(0x2E) > *(u8 *)((u32)&D_80082D84 + i + 2) && !(func_80031964() & 0xC0)) {
                u8 *slot = (u8 *)&D_80082D84;

                slot += i;
                func_8003F230(slot);
            }
            if (*(u16 *)((u32)&D_80084ED0 + i) != missing && *(u8 *)((u32)&D_80084ED0 + i + 3) == marker &&
                (u16)func_80031A1C(0x2E) > *(u8 *)((u32)&D_80084ED0 + i + 2) && !(func_80031964() & 0xC0)) {
                u8 *slot = (u8 *)&D_80084ED0;

                slot += i;
                func_8003F230(slot);
            }
            i += 4;
        } while (i < 0x10);
    }
    D_800740CC = 0;
}
