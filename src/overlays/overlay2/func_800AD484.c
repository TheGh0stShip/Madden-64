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

extern u8 D_800C27E8[];
extern u8 D_800C2800[];
extern u8 D_800C29D4[];
extern u8 D_800C29E0[];
extern u8 D_800C284C[];
extern u8 D_800C2864[];
extern u8 D_800C08D8[];

void func_800D67B8(Dialog *);
s16 func_800D6454(Dialog *);
void func_80094028(void);
void func_80094080(void);
void func_80092B98(void);
s32 func_800E1E04(s16);
s16 func_800E1E74(s32);
void func_800ACC64(s32);
void func_800ACA58(s32, s32);

void func_800AD484(s32 arg0, s16 arg1) {
    Dialog dialog;
    s16 result;

    func_800D67B8(&dialog);
    dialog.title = D_800C27E8;
    dialog.text = D_800C2800;
    dialog.yes = D_800C29D4;
    dialog.no = D_800C29E0;
    dialog.unk18 = 1;
    if (func_800D6454(&dialog) == 0) {
        func_80094028();
        func_80092B98();
        func_80092B98();
        result = func_800E1E74(func_800E1E04(arg1));
        func_80094080();
        func_80092B98();
        func_80092B98();
        func_80092B98();
        func_80092B98();
        if (result != 0) {
            func_800D67B8(&dialog);
            dialog.title = D_800C284C;
            dialog.text = D_800C2864;
            dialog.yes = D_800C08D8;
            dialog.unk18 = 0;
            func_800D6454(&dialog);
        }
        func_800ACC64(arg0);
        func_800ACA58(arg0, 6);
    }
}
