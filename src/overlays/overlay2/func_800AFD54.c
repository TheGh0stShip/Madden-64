#include "types.h"

typedef struct {
    u8 unk_00[0x14];
    u32 unk_14;
} Unk800AFD54_Sub;

typedef struct {
    u8 unk_00[8];
    u16 unk_08;
    u8 unk_0A[0x3A];
    s32 unk_44;
} Unk800AFD54_Menu;

typedef struct {
    u8 unk_00[0xC];
    Unk800AFD54_Menu *unk_0C;
} Unk800AFD54_Holder;

typedef struct {
    u8 unk_00[0x24];
    Unk800AFD54_Holder *unk_24;
    u8 unk_28[0x10];
    Unk800AFD54_Sub *unk_38;
    u8 unk_3C[0x5C];
    s32 unk_98;
} Unk800AFD54_Obj;

typedef struct {
    u8 unk_00[0x320];
    u16 unk_320;
} Unk800AFD54_Res;

extern s32 D_800BDF10[];
extern s32 D_800BDF34[];
extern s16 D_800C507C;
extern Unk800AFD54_Res *D_800C5094;
void func_8001EC20(s32, s32);
void func_80032F3C(s32, void *);
void func_800AACA8(Unk800AFD54_Sub *, s32, Unk800AFD54_Obj *);
Unk800AFD54_Res *func_800D3FF4(s32, s32, s32, s32, s32);
void func_800D63B4(Unk800AFD54_Obj *);
void func_800DB0AC(Unk800AFD54_Menu *, s32, s32);
void func_800DB44C(Unk800AFD54_Menu *, s32 *, s32 *, s32 *);
void func_800DB478(Unk800AFD54_Menu *);
void func_800DD4B8(void);
void func_800DD634(void);
void func_800DF6EC(void);
void func_800DF72C(void);

void func_800AFD54(Unk800AFD54_Obj *arg0, s32 arg1, s16 arg2) {
    Unk800AFD54_Obj *obj;
    Unk800AFD54_Menu *menu;
    s32 sp18;
    s32 sp1C;
    s32 sp20;

    func_800DD634();
    obj = arg0;
    menu = obj->unk_24->unk_0C;
    func_800DB44C(menu, &sp18, &sp1C, &sp20);
    switch (arg2) {
    case 2:
        func_800DF6EC();
        D_800C507C = (D_800C507C > 0) ? D_800C507C - 1 : 8;
        goto reload;
    case 3:
        func_800DF6EC();
        if (D_800C507C < 8) {
            D_800C507C++;
        } else {
            D_800C507C = 0;
        }
    reload:
        func_80032F3C(0, D_800C5094);
        D_800C5094 = func_800D3FF4(D_800BDF10[D_800C507C] | 1, 0x1E, 0, 0, 0);
        func_800DB0AC(menu, 0, 0);
        menu->unk_08 = D_800C5094->unk_320;
        if (menu->unk_08 < 8) {
            menu->unk_08 = 8;
        }
        obj->unk_98 = D_800BDF34[D_800C507C];
        func_8001EC20(menu->unk_44, 9);
        func_800DB478(menu);
        break;
    case 13:
        func_800AACA8(obj->unk_38, 0, obj);
        obj->unk_38->unk_14 &= ~1;
        break;
    case 12:
        func_800D63B4(obj);
        break;
    case 8:
    case 28:
        func_800DF72C();
        func_800DD4B8();
        break;
    }
}
