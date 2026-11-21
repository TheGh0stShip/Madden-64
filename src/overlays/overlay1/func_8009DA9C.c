#include "types.h"

typedef struct {
    u32 unk_00;
    s32 unk_04[5];
    s32 unk_18;
} Unk8009DA9C_State;

typedef struct {
    s32 unk_00;
    s32 unk_04;
    Unk8009DA9C_State *unk_08;
} Unk8009DA9C_Obj;

extern s32 D_800784A8;
extern s32 D_800784AC;
extern u8 D_8009942C[];
void func_80045620(void);
void func_80008F30(s32, void *, void *, s32);

void func_8009DA9C(Unk8009DA9C_Obj *arg0, s32 arg1) {
    Unk8009DA9C_State *s = arg0->unk_08;

    switch (s->unk_00) {
    case 0:
    case 3:
        D_800784A8 = 0;
        D_800784AC = 0;
        func_80008F30(arg1, D_8009942C, arg0, s->unk_18);
        func_80008F30(arg1, func_80045620, arg0, 0xF3);
        break;
    case 1:
        func_80008F30(arg1, D_8009942C, arg0, 0xF7);
        break;
    case 2:
        break;
    }
}
