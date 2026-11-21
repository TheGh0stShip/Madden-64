#include "types.h"

typedef struct {
    void *title;
    void *text;
    s32 unk08;
    void *yes;
    void *no;
    s32 unk14;
    s32 unk18;
    s32 unk1C;
} Dialog;

typedef struct {
    s32 v[4];
} MessageValues;

typedef struct {
    s32 unk00;
    s32 unk04;
} MessageData;

typedef struct {
    u8 unk00;
    u8 pad01[39];
} RosterPlayer;

typedef struct {
    s32 unk00;
    u16 unk04;
    u16 unk06;
    s16 unk08;
    s16 unk0A;
    u8 pad0C[4];
    u16 unk10;
    u16 unk12;
    u8 unk14;
} TradeState;

typedef struct {
    u8 pad00[0x60];
    TradeState *unk60;
} TradeScreen;

extern MessageValues D_8008BF0C;
extern s16 D_800C5C36;
extern s16 D_80073D68;
extern u16 D_80080CFC[][0x10A6];
extern RosterPlayer D_80080D78[];
extern RosterPlayer D_80082EC4[];
extern u8 D_800C0414[];
extern u8 D_800C0618[];
extern MessageData D_800C0640;
extern s32 D_800C0648[];
extern s16 D_800895D2;
extern u16 D_800BDF0A;
extern u8 D_800C31AC[];
extern u8 D_800C31C4[];
extern u8 D_800C3320[];
extern u8 D_800C3338[];
extern u8 D_800C2A90[];
extern u8 D_800C2AA0[];

void func_800AEAFC(TradeScreen *);
void func_800AF050(TradeState *);
void func_800D67B8(Dialog *);
s16 func_800D6454(Dialog *);
s16 func_800BD520(u16);
void func_800AF23C(void);
s32 func_8003FBF8(u16, s32);
u8 *func_80032E00(s32, s32);
void func_800BD6D0(u16, u8 *);
void func_8003DDF8(void *object, void *data, s32 *values, s32 count, s32 zero);
void func_8003E23C(s32 *values);
s16 func_800BD788(Dialog *, s16, s16);
void func_80039C14(u16, u16);
void func_800AE734(TradeScreen *, u16);
u16 func_800AF1D4(u8);
void func_800AF0DC(TradeScreen *, u16, s32);
void func_800AE460(TradeScreen *);

void func_800AEB4C(TradeScreen *screen) {
    u8 teams[2];
    Dialog dialog;
    MessageValues values = D_8008BF0C;
    TradeState *state = screen->unk60;
    s16 ok = 1;
    s32 result;
    u8 *ratings;
    u16 i;

    func_800AEAFC(screen);
    func_800AF050(state);
    if (state->unk04 == state->unk06) {
        ok = 0;
        func_800D67B8(&dialog);
        dialog.title = D_800C31AC;
        dialog.text = D_800C31C4;
        func_800D6454(&dialog);
    }
    if (ok == 1) {
        if (D_800C5C36 == 0 && (func_800BD520(state->unk04) == 1 || func_800BD520(state->unk06) == 1)) {
            ok = 0;
            func_800AF23C();
        }
        if (ok == 1) {
            if (state->unk10 >= 0x6EF || state->unk12 >= 0x6EF) {
                if (D_80073D68 != 0) {
                    ok = 0;
                    func_800D67B8(&dialog);
                    dialog.title = D_800C3320;
                    dialog.text = D_800C3338;
                    func_800D6454(&dialog);
                }
            }
            if (ok == 1) {
                if (D_800C5C36 == 0) {
                    result = func_8003FBF8(D_80080CFC[0][(u16)state->unk08], 0);
                    if (result != 11 || func_8003FBF8(D_80080CFC[1][(u16)state->unk0A], 0) != result) {
                        ok = 0;
                        func_800D67B8(&dialog);
                        dialog.title = D_800C2A90;
                        dialog.text = D_800C2AA0;
                        func_800D6454(&dialog);
                    }
                }
                if (ok == 1) {
                    teams[0] = D_80080D78[(u16)state->unk08].unk00 & 0x3F;
                    teams[1] = D_80082EC4[(u16)state->unk0A].unk00 & 0x3F;
                    if (teams[0] != teams[1]) {
                        ratings = func_80032E00(0, 0x19);
                        for (i = 0; i < 2; i++) {
                            func_800BD6D0(i, ratings);
                            if (ratings[teams[i]] <= D_800C0414[teams[i]]) {
                                func_800D67B8(&dialog);
                                D_800C0640.unk04 = D_800C0648[teams[i]];
                                func_8003DDF8(D_800C0618, &D_800C0640, values.v, 0x96, D_800895D2);
                                ok = 0;
                                dialog.title = (void *)values.v[1];
                                dialog.text = (void *)values.v[2];
                                dialog.unk08 = values.v[3];
                                func_800D6454(&dialog);
                                func_8003E23C(values.v);
                                break;
                            }
                        }
                    }
                    if (ok == 1) {
                        if (func_800BD788(&dialog, state->unk08, state->unk0A) != 0) {
                            ok = 0;
                        }
                        if (ok == 1) {
                            func_80039C14(state->unk08, state->unk0A);
                            state->unk00 = 0;
                            state->unk14 = 0;
                            state->unk08 = 0;
                            D_800BDF0A = state->unk04;
                            func_800AE734(screen, state->unk04);
                            func_800AF0DC(screen, func_800AF1D4(state->unk14), 7);
                            func_800AE460(screen);
                        }
                    }
                    }
                }
            }
        }
    }
