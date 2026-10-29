#include "types.h"

typedef struct {
    char *line0;
    char *line1;
    s32 unk08;
    char *option0;
    char *option1;
    s32 unk14;
    s32 enabled;
    s32 unk1C;
} Dialog;

extern char D_800C08E0[];
extern char D_800C08F8[];
extern char D_8006BCA4[];
extern char D_8006BCA8[];
extern u8 D_800BF2EC[];

void func_800D67B8(Dialog *);
s16 func_800D6454(Dialog *);
void func_8008D1B0(s32);
void func_800DD5B8(void *);
void func_80093FD8(void);

s32 func_800B8B30(void) {
    Dialog dialog;

    func_800D67B8(&dialog);
    dialog.line0 = D_800C08E0;
    dialog.line1 = D_800C08F8;
    dialog.option0 = D_8006BCA4;
    dialog.option1 = D_8006BCA8;
    dialog.enabled = 1;
    if (func_800D6454(&dialog) == 0) {
        func_8008D1B0(0x12C);
        func_800DD5B8(D_800BF2EC);
        func_80093FD8();
    }
    return 0x19;
}
