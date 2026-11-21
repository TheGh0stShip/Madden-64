#include "types.h"

typedef struct {
    char *unk_00;
    char *unk_04;
    u8 pad08[4];
    char *unk_0C;
    char *unk_10;
    u8 pad14[4];
    s32 unk_18;
    u8 pad1C[4];
} Message;

extern u16 D_800C4EE8;
extern u16 D_800C5098;
extern u16 D_800C4AD0;
extern s8 D_800724F8;
extern s8 D_800724F9;
extern s8 D_800C5C38;
extern char D_800C28FC[];
extern char D_800C2918[];
extern char D_800C08D8[];
extern char D_800C0FC0[];
extern char D_800C0FDC[];
extern char D_800C0FF4[];
extern char D_800C1008[];
extern char D_800C29D4[];
extern char D_800C29E0[];
extern char D_800C0958[];
extern char D_800C26A0[];
extern char D_800C26B8[];
extern char D_8008BE68[];
extern char D_8008BE70[];
extern char D_8008BE78[];
extern char D_8008BE80[];
extern char D_8008BE88[];
extern char D_8008BE90[];
extern char D_8008BE98[];
extern u8 D_80088118[];

s32 func_800E1E04(s16 index);
s16 func_800E1F10(s32 team);
s16 overlay2_return_zero(u16 index);
void func_800D67B8(Message *message);
s16 func_800D6454(Message *message);
void func_80094028(void);
void func_80092B98(void);
void func_80094080(void);
s16 func_800E1690(s32 team, s32 arg1);
void func_800E1FCC(s32 size, s32 arg1);
void func_800E2278(char *name, s32 size, s32 arg2);
void func_800E2068(char *name, u8 *buffer, s32 arg2);
void func_80028B08(void);
void func_800962F0(void);
void func_80096604(void);
void func_8009652C(void);
void func_8008D7B4(void);
void func_800ACC64(void *state);
void func_800ACA58(void *state, s32 mode);

void func_800AD060(void *state, s32 index) {
    Message message;
    s16 cancel;
    s16 loaded;

    if (func_800E1F10(func_800E1E04(index)) == 0 && overlay2_return_zero(index) == 0) {
        func_800D67B8(&message);
        message.unk_00 = D_800C28FC;
        message.unk_04 = D_800C2918;
        message.unk_0C = D_800C08D8;
        message.unk_18 = 0;
        func_800D6454(&message);
        cancel = 1;
    } else if ((D_800C4EE8 == 0x5AA5 || D_800C5098 == 0xA55A || D_800C4AD0 == 0xA5A5) &&
               overlay2_return_zero(index) == 0) {
        func_800D67B8(&message);
        message.unk_00 = D_800C0FC0;
        if (D_800C4EE8 == 0x5AA5) {
            message.unk_04 = D_800C0FDC;
        } else if (D_800C5098 == 0xA55A) {
            message.unk_04 = D_800C0FF4;
        } else if (D_800C4AD0 == 0xA5A5) {
            message.unk_04 = D_800C1008;
        }
        message.unk_0C = D_800C29D4;
        message.unk_10 = D_800C29E0;
        message.unk_18 = 1;
        cancel = func_800D6454(&message);
    } else {
        cancel = 0;
    }
    if (cancel == 0) {
        u16 *magic = &D_800C4EE8;

        *magic = 0;
        D_800C5098 = 0;
        D_800C4AD0 = 0;
        func_80094028();
        func_80092B98();
        loaded = func_800E1690(func_800E1E04(index), 1);
        func_80094080();
        if (loaded == 0) {
            func_800E2068(D_8008BE68, D_80088118, 0);
            func_80096604();
            func_8009652C();
            func_8008D7B4();
            func_800D67B8(&message);
            message.unk_00 = D_800C0958;
            message.unk_0C = D_800C08D8;
            func_800D6454(&message);
            if (*magic == 0x5AA5) {
                D_800724F8 = 1;
                D_800724F9 = 1;
            }
            D_800C5C38 = 1;
        } else {
            func_800E1FCC(0x86D0, 0);
            func_800E2278(D_8008BE68, 0x358, 0);
            func_800E2278(D_8008BE70, 0x134, 0);
            func_800E2278(D_8008BE78, 0xBA0, 1);
            func_800E2278(D_8008BE80, 0x5C08, 1);
            func_800E2278(D_8008BE88, 0x1458, 1);
            func_800E2278(D_8008BE90, 0x3C0, 1);
            func_800E2278(D_8008BE98, 0x1E4, 1);
            func_80028B08();
            func_800962F0();
            func_80096604();
            func_8009652C();
            func_800D67B8(&message);
            message.unk_00 = D_800C26A0;
            message.unk_04 = D_800C26B8;
            message.unk_0C = D_800C08D8;
            message.unk_18 = 0;
            func_800D6454(&message);
        }
    }
    func_800ACC64(state);
    func_800ACA58(state, 6);
}
