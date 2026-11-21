#include "types.h"

#ifndef NULL
#define NULL 0
#endif

typedef struct {
    u8 pad[0x1E];
    u8 unk_1E;
} Rec;

void conditional_value_resolve(s32, Rec *);
s32 func_80031964(void);
s32 func_80031A1C(s32);
void func_800363F4(u16, s32, s32);
void func_8003DDF8(void *, s32 *, void *, s32, s32);
s32 func_80041BDC(s32, s32);
void func_80041DD4(s32, s32, s32);
void func_80041E54(s32);
s32 func_800AD124(Rec *);
s32 func_800AD184(s16);
void func_800AD404(void);
void func_800AD5D0(s32, s32, s32, s32);
s32 func_800AE680(void);
void func_800AEA9C(s32);
s16 func_800AEFF8(s32, s16, void *, s32);
void func_800B7DD8(s32, s32, void *, Rec *, Rec *);
s32 global_buffer_prepare(s16);
void primary_handle_release(void);
void secondary_handle_release(void);

extern u8 D_8006B948[];
extern s32 D_8006B98C;
extern s32 D_8006B990;
extern s32 D_8006B994;
extern s32 D_8006B998;
extern s32 D_8006B99C;
extern void *D_8006B9A0;
extern s32 D_8006B9A4;
extern s16 D_8006B9C2;
extern s32 D_8006B9D4;
extern u8 D_8006DAD0[];
extern u8 D_8006DB78[];
extern u8 D_8006DB8C[];
extern u8 D_8006DBAC[];
extern u8 D_8006DBC8[];
extern u8 D_8006DBE4[];
extern u8 D_8006DC10[];
extern u8 D_8006DC30[];
extern u8 D_8006DC58[];
extern u8 D_8006DC7C[];
extern u8 D_8006DC94[];
extern u8 D_8006DCB4[];
extern u8 D_8006DCD4[];
extern u8 D_8006DD08[];
extern u8 D_8006DD28[];
extern u8 D_8006DD44[];
extern u8 D_8006DD60[];
extern u8 D_8006DD7C[];
extern u8 D_8006DDA0[];
extern u8 D_8006DDC8[];
extern u8 D_8006DDD8[];
extern u8 D_8006DDF0[];
extern u8 D_8006DE20[];
extern u8 D_8006DE38[];
extern u8 D_8006DE58[];
extern u8 D_8006DE78[];
extern u8 D_8006DEA0[];
extern u8 D_8006DF78[];
extern u8 D_8006DF80[];
extern u8 D_8006DFEC[];
extern u8 D_8006DFF8[];
extern u8 D_8006E1AC[];
extern s32 D_80080C10;
extern u16 D_800857E0;
extern u16 D_800857E2[];
extern Rec *D_800857E4;
extern Rec *D_800857E8;
extern s16 D_80086BF2[];
extern u16 D_80088472;
extern Rec *D_80088714;
extern s16 D_80088AE4;
extern s16 D_800895D2;
extern u8 D_8008AF70;
extern s32 D_8008AF88;

void func_800B0468(void) {
    s32 r;
    u8 *msg = NULL;
    s16 mode;
    s32 extra;
    s32 id;
    s16 dur;

    func_800AD404();
    id = -1;
    primary_handle_release();
    mode = 0x68;
    secondary_handle_release();
    D_8006B98C = 6;
    if (D_800857E4 != NULL) {
        D_8006B990 = func_800AD124(D_800857E4);
        id = D_800857E4->unk_1E;
    }
    D_8006B994 = 0;
    D_8006B998 = 0;
    D_8006B99C = 0;
    D_8006B9A0 = NULL;
    D_8006B9A4 = D_8008AF88;
    switch ((s16)(D_800857E0 - 1)) {
    case 16:
        msg = D_8006DC30;
        break;
    case 14:
        msg = D_8006E1AC;
        break;
    case 10:
        msg = D_8006DEA0;
        id = D_800857E2[0];
        D_8006B9A0 = D_8006DFF8;
        func_800B7DD8(2, 4, NULL, NULL, NULL);
        break;
    case 11:
        msg = D_8006DEA0;
        id = D_800857E2[0];
        D_8006B9A0 = D_8006DFEC;
        func_800B7DD8(2, 4, (void *)1, NULL, NULL);
        break;
    case 4:
        msg = D_8006DD28;
        func_800B7DD8(2, 5, NULL, NULL, NULL);
        break;
    case 5:
        msg = D_8006DD44;
        func_800B7DD8(2, 5, (void *)1, NULL, NULL);
        break;
    case 18:
        msg = D_8006DD60;
        id = D_800857E2[0];
        func_800B7DD8(2, 9, NULL, NULL, NULL);
        break;
    case 21:
        msg = D_8006DDC8;
        if (D_800857E4 != NULL) {
            msg = D_8006DD7C;
        }
        if (D_80088AE4 == 0) {
            func_80041E54(0xC);
        } else {
            func_80041DD4(0x3B, 0xF, 0xB4);
        }
        break;
    case 22:
        msg = D_8006DDD8;
        if (D_800857E4 != NULL) {
            msg = D_8006DDA0;
        }
        break;
    case 6:
        msg = D_8006DDF0;
        D_8006B994 = global_buffer_prepare(D_800857E2[0]);
        D_8006B9A0 = D_8006DFF8;
        func_800B7DD8(2, 0xA, NULL, NULL, NULL);
        break;
    case 7:
        msg = D_8006DDF0;
        D_8006B994 = global_buffer_prepare(D_800857E2[0]);
        D_8006B9A0 = D_8006DFEC;
        func_800B7DD8(2, 0xA, (void *)1, NULL, NULL);
        break;
    case 9:
        msg = D_8006DE78;
        func_800B7DD8(2, 8, D_800857E4, D_800857E8, NULL);
        break;
    case 19:
        msg = D_8006DC94;
        break;
    case 20:
        msg = D_8006DCB4;
        break;
    case 2:
        r = (s16)func_80041BDC(5, 0x28);
        if (D_80088AE4 == 0) {
            func_80041E54(0xC);
        } else {
            func_80041DD4(0x3C, 0xF, 0xB4);
        }
        msg = D_8006DC10;
        D_8006B998 = func_800AD184(D_800857E2[0]);
        D_8006B99C = func_800AD124(D_800857E8);
        if (mode != 0x68) {
            conditional_value_resolve(mode, D_800857E4);
        }
        if (r == 0) {
            func_800B7DD8(2, 6, D_800857E4, NULL, NULL);
        }
        break;
    case 3:
        msg = D_8006DE20;
        if (mode != 0x68) {
            conditional_value_resolve(mode, D_800857E4);
        }
        func_800B7DD8(2, 7, D_800857E4, NULL, NULL);
        break;
    case 17:
        {
            Rec **pp = &D_800857E8;
            if (*pp != NULL) {
                msg = D_8006DE38;
                D_8006B99C = func_800AD124(*pp);
                id = D_800857E8->unk_1E;
                if (mode != 0x68) {
                    conditional_value_resolve(mode, *pp);
                }
            } else {
                msg = D_8006DE58;
            }
            break;
        }
    case 0:
        D_8006B998 = func_800AD184(D_800857E2[0]);
        func_800B7DD8(2, 1, D_800857E2, D_800857E4, D_800857E8);
        msg = D_8006DB78;
        if ((s16)D_800857E2[0] <= 0 && D_800857E8 != NULL) {
            msg = D_8006DB8C;
            D_8006B99C = func_800AD124(D_800857E8);
        }
        if (D_8008AF70 == 0) {
            if ((u16)(D_800857E2[0] + 0x2F) < 0x40) {
                func_80041BDC(0x1E, 0x1E);
            }
            if ((s16)D_800857E2[0] > 0xA0) {
                func_80041BDC(0xD, 0x28);
            }
        }
        if (mode != 0x68) {
            conditional_value_resolve(mode, D_800857E4);
        }
        break;
    case 1:
        msg = D_8006DBAC;
        D_8006B998 = func_800AD184(D_800857E2[0]);
        D_8006B99C = func_800AD124(D_800857E8);
        func_800B7DD8(2, 2, D_800857E2, D_800857E4, D_800857E8);
        if (mode != 0x68) {
            if (func_80031964() & 0x400) {
                conditional_value_resolve(mode, D_800857E4);
            } else {
                conditional_value_resolve(mode, D_800857E8);
            }
        }
        break;
    case 8:
        if (D_80088714 != NULL) {
            msg = D_8006DBE4;
            D_8006B99C = func_800AD124(D_80088714);
        } else {
            msg = D_8006DBC8;
        }
        func_800B7DD8(2, 3, D_80088714, NULL, NULL);
        break;
    case 13:
        D_8006B994 = global_buffer_prepare(D_800857E2[0]);
        if (D_80086BF2[0] == 0x7FFF) {
            msg = D_8006DC7C;
            D_8006B9A0 = D_8006DF78;
        } else if (D_80086BF2[0] == 0x7FFE) {
            msg = D_8006DC7C;
            D_8006B9A0 = D_8006DF80;
        } else {
            D_8006B99C = func_800AD124(D_800857E8);
            D_8006B998 = func_800AD184(D_80086BF2[0]);
            msg = D_8006DC58;
            id = D_800857E8->unk_1E;
        }
        break;
    case 12:
        msg = D_8006DD08;
        D_8006B994 = global_buffer_prepare(D_800857E2[0]);
        if (D_80086BF2[0] == 0x7FFF) {
            if (D_80080C10 & 0x04000000) {
                D_8006B9A0 = D_8006DAD0;
            } else {
                D_8006B9A0 = D_8006DF78;
            }
        } else if (D_80086BF2[0] == 0x7FFE) {
            D_8006B9A0 = D_8006DF80;
        } else {
            D_8006B99C = func_800AD124(D_800857E8);
            msg = D_8006DCD4;
            D_8006B998 = func_800AD184(D_80086BF2[0]);
        }
        break;
    }
    extra = 0;
    if ((s16)D_800857E0 == 0xF) {
        extra = func_800AE680();
        func_800363F4(D_80088472, (u16)func_80031A1C(2) + 8, D_8006B9D4);
        msg = D_8006E1AC;
    }
    if (msg != NULL) {
        dur = 0x96;
        if (mode == 0x60) {
            dur = 0xB4;
        }
        func_8003DDF8(msg, &D_8006B98C, D_8006B948, dur, D_800895D2);
        D_8006B9C2 = func_800AEFF8(mode, id, D_8006B948, extra);
        func_800AEA9C(1);
    }
    func_800AD5D0(0, 0, 0, 0);
}
