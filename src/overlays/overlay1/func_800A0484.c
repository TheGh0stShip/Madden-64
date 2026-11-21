#include "types.h"

typedef struct TransitionCommand {
    void (*callback)(void);
    s32 unk_04;
    s32 unk_08;
    u8 pad0C[4];
    s16 value;
    u8 pad12[6];
} TransitionCommand;

typedef struct Unk214C {
    u16 unk_00;
    u8 pad02[0x214A];
} Unk214C;

extern u16 D_8006B7A8;
extern s32 D_80080C10;
extern s32 D_80080C2C;
extern Unk214C D_80082D38[];
extern s16 D_80085288;
extern s16 D_800857F0;
extern u8 D_80086DCC;
extern s16 D_800876DC;
extern s16 D_80087758;
extern s16 D_80087AAC;
extern u8 D_80087AB0;
extern s16 D_80087AC0;
extern s16 D_80087B5E;
extern s16 D_80088624;
extern s16 D_80088AE4;
extern s16 D_800892A8;
extern u16 D_800892D0;
extern s16 D_80089320;
extern s16 D_800894FC;
extern s32 D_8008A3DC;
extern volatile u16 D_8008A5B4;

s16 func_8002098C(void);
s16 func_8002099C(void);
void func_80020A68(void);
u32 func_8002A358(u32, u32);
u32 func_8002AB98(s32);
u16 func_800397C8(u16, u16);
s16 func_8003CBB8(void);
void func_8003CE88(s32, s16, s32);
void func_8003CF78(s32, s32);
void status_overlay_disable(u32);
void func_8009C3BC(void);
s32 func_8009C900(s32, s32);
void func_8009C9E8(void);
void func_8009CBB8(s32, s32);
void func_8009D298(void);
s32 func_8009EDB0(void);
void func_800A1844(s32);
void func_800A2834(void);
s32 func_800ABBE0(void);
void func_800AE5C4(u16);
void func_800AE8E4(void);
void func_800AE924(TransitionCommand *);
void func_800AEA48(void);
s16 func_800AEAAC(void);
void func_800B21F4(void);
void func_800BC98C(void);
void func_800BE784(void);
void func_800C1C84(void);
void func_800C5F80(void);
void func_800CC18C(void);
void D_800AEBEC(void);
void D_800AEDA8(void);
void subsystem_sequence_start(void);

void func_8009BD60(void)
{
    TransitionCommand cmd;
    u32 slot0;
    u32 slot1;
    u32 best;
    u32 count;
    s32 team;

    if (D_800857F0 != 0) {
        D_800857F0 -= D_8008A5B4;
        if (D_800857F0 <= 0 && D_8006B7A8 == 0) {
            if (D_80087AC0 == 1) {
                func_8003CF78(0x1D, 0xF);
            } else {
                func_8003CE88(0x17, func_8003CBB8() * 10 + 0x57, 0x10);
            }
            D_800892D0 = 0;
            D_80080C2C = 0;
            func_800AE8E4();
            func_800A1844(0);
            if ((D_80080C10 & 0x800001) || D_80089320 == -1) {
                if (D_80080C10 & 0x200) {
                    status_overlay_disable(3);
                }
            }
            func_800B21F4();
            if (!(D_80080C10 & 0x200000)) {
                D_80087AB0 = 2;
                func_800C5F80();
                D_800857F0 = 1;
                if (D_80080C10 & 0x2000) {
                    func_800BE784();
                }
                if (D_80080C10 & 0x10) {
                    func_800BC98C();
                }
                func_800C1C84();
                func_8009EDB0();
                D_80080C10 &= ~0x4000;
                if (D_800876DC == 2 || D_800876DC == 4) {
                    if (D_80087AAC < 0x79 && D_80088624 >= 0x79) {
                        status_overlay_disable(3);
                    }
                }
                func_8009D298();
                D_80080C10 |= 0x200000;
            } else {
                if (func_8002098C() != 0 && func_8002099C() == 0) {
                    func_800A2834();
                    func_8009C9E8();
                    func_8009D298();
                }
                func_8009EDB0();
            }
            if (!(D_80080C10 & 0x200) && D_80086DCC == 0 && D_800876DC == 4 && D_80087AAC < 0x29) {
                slot0 = func_8002AB98(0);
                slot1 = func_8002AB98(1);
                count = func_8002A358(0, slot0);
                if (func_8002A358(1, slot1) < count) {
                    team = 0;
                    best = slot0;
                } else {
                    team = 1;
                    best = slot1;
                }
                slot0 = func_800397C8(team, best);
                if (slot0 == 0) {
                    slot0 = 0x631;
                }
                func_800AE5C4(slot0);
                D_80086DCC = 1;
                cmd.callback = D_800AEBEC;
                cmd.value = 0x15E;
                cmd.unk_04 = team;
                cmd.unk_08 = best;
                func_800AE924(&cmd);
                cmd.callback = D_800AEDA8;
                cmd.value = 1;
                func_800AE924(&cmd);
            }
            if (func_800AEAAC() == 0) {
                func_800AEA48();
            }
            D_8008A3DC = 0;
            D_800857F0 = 0;
            D_80080C10 &= ~0x81C8;
            func_800CC18C();
        }
    }
    if (D_800876DC == 2 || D_800876DC == 4) {
        if (D_80087AAC < 0x79) {
            if (D_80080C10 & 0x4000) {
                func_800ABBE0();
            }
            if (D_80088624 >= 0x79) {
                if (!(D_80080C10 & 0x4000)) {
                    status_overlay_disable(3);
                    func_8009CBB8(0x2D, 0xD2);
                    func_8009C9E8();
                    func_8009C900(0x19, 2);
                    cmd.callback = subsystem_sequence_start;
                    cmd.value = 0xAF;
                    func_800AE924(&cmd);
                    D_80088624 = D_80087AAC;
                }
            }
        } else {
            D_80088624 = D_80087AAC;
        }
    }
    if (!(D_80080C10 & 0x4000) && D_80087AAC == 0 && D_800894FC == 0 && !(D_80080C10 & 0x100000)) {
        func_8009C3BC();
    }
    if (D_80080C10 & 0x200) {
        if (D_80087AAC != 0) {
            D_800892A8 -= D_8008A5B4;
            if (D_800892A8 < 0) {
                D_80087AAC--;
                D_800892A8 += D_80085288;
                if (D_80087AAC == 0) {
                    status_overlay_disable(3);
                }
                D_80082D38[D_80088AE4].unk_00++;
            }
        }
    }
    if (D_80080C10 & 0x400) {
        D_80087B5E -= D_8008A5B4;
        if (D_80087B5E < 0) {
            D_80087B5E += D_80085288;
            D_80087758--;
            if (D_80087758 == 0) {
                func_8009C9E8();
                D_80087758 = 0;
                func_80020A68();
            }
        }
    }
}
