#include "types.h"

typedef struct {
    s8 *title;
    s8 *text;
    s8 *yes;
    s8 *no;
    s8 *unk_10;
    s32 unk_14;
    s32 mode;
    s32 unk_1C;
} Dialog;

extern s8 D_80088118[];
extern s32 D_800886F4;
extern s8 D_8008BE68[];
extern s8 D_800C08D8[];
extern s8 D_800C093C[];
extern s8 D_800C26C8[];
extern s8 D_800C26E0[];
extern s8 D_800C26F4[];
extern s8 D_800C2704[];
extern s8 D_800C271C[];
extern s8 D_800C2740[];
extern s8 D_800C2760[];
extern s8 D_800C2774[];
extern s8 D_800C2788[];
extern s8 D_800C2818[];
extern s8 D_800C2830[];
extern s8 D_800C28EC[];
extern s8 D_800C2918[];
extern s8 D_800C29D4[];
extern s8 D_800C29E0[];
extern u8 D_800C5C38;
void func_8008DB64(void);
void func_80092B98(void);
void func_80094028(s32);
void func_80094080(void);
void func_80096714(void);
s16 func_800AD984(s32);
s16 func_800D6454(Dialog *);
void func_800D67B8(Dialog *);
s16 func_800E17A8(s32, s32);
s32 func_800E1E04(s16);
void func_800E1E74(s32);
s16 func_800E1F10(s32);
void func_800E2190(s8 *, s8 *, s32);

void func_800ADC50(s32 arg0, s16 arg1, s16 arg2) {
    Dialog dialog;
    s16 ok = 1;
    s16 result;

    D_800C5C38 = 0;
    if (arg2 == 0) {
        if (D_800886F4 < func_800AD984(1)) {
            func_800D67B8(&dialog);
            dialog.title = D_800C2704;
            dialog.text = D_800C271C;
            dialog.yes = D_800C2740;
            dialog.no = D_800C08D8;
            dialog.mode = 0;
            func_800D6454(&dialog);
            func_800D67B8(&dialog);
            dialog.title = D_800C2760;
            dialog.text = D_800C2774;
            dialog.yes = D_800C2788;
            dialog.no = D_800C08D8;
            dialog.mode = 0;
            func_800D6454(&dialog);
            ok = 0;
        }
    } else if (func_800E1F10(func_800E1E04(arg1)) != 0) {
        func_800D67B8(&dialog);
        dialog.title = D_800C2818;
        dialog.text = D_800C2830;
        dialog.no = D_800C29D4;
        dialog.unk_10 = D_800C29E0;
        dialog.mode = 1;
        ok = func_800D6454(&dialog) == 0;
    } else {
        func_800D67B8(&dialog);
        dialog.title = D_800C28EC;
        dialog.text = D_800C2918;
        dialog.no = D_800C08D8;
        dialog.mode = 0;
        func_800D6454(&dialog);
        ok = 0;
    }
    if (ok == 1) {
        func_80094028(0);
        func_80092B98();
        func_80092B98();
        func_8008DB64();
        func_800E2190(D_8008BE68, D_80088118, 0);
        func_80096714();
        if (arg2 == 1) {
            func_800E1E74(func_800E1E04(arg1));
        }
        result = func_800E17A8(0, 1);
        func_80094080();
        func_80092B98();
        func_80092B98();
        func_80092B98();
        if (result == 4) {
            func_800D67B8(&dialog);
            dialog.title = D_800C2704;
            dialog.text = D_800C271C;
            dialog.yes = D_800C2740;
            dialog.no = D_800C08D8;
            dialog.mode = 0;
            func_800D6454(&dialog);
            func_800D67B8(&dialog);
            dialog.title = D_800C2760;
            dialog.text = D_800C2774;
            dialog.yes = D_800C2788;
            dialog.no = D_800C08D8;
            dialog.mode = 0;
            func_800D6454(&dialog);
        } else if (result != 0) {
            func_800D67B8(&dialog);
            dialog.title = D_800C26C8;
            dialog.text = D_800C26E0;
            dialog.yes = D_800C26F4;
            dialog.no = D_800C08D8;
            dialog.mode = 0;
            func_800D6454(&dialog);
        } else {
            D_800C5C38 = 1;
            func_800D67B8(&dialog);
            dialog.title = D_800C093C;
            dialog.no = D_800C08D8;
            func_800D6454(&dialog);
        }
    }
}
