#include "types.h"

typedef struct {
    u8 unk_000[0x134];
} Unk800895B8;

typedef struct {
    s32 count;
    s32 list[0xB5];
} Unk800D01AC_74;

typedef struct {
    s32 unk_0[4];
} Unk800892D8;

typedef struct {
    u8 pad00[0x2C];
    s32 unk_2C;
    s32 unk_30;
    s32 unk_34;
    u8 pad38[0x28];
    Unk800895B8 *unk_60;
    u8 pad64[0x10];
    Unk800D01AC_74 unk_74;
} Unk800D01AC;

typedef struct {
    u8 pad00[0x14];
    Unk800892D8 unk_14;
} Unk800DD634;

extern Unk800895B8 *D_800895B8;
extern s32 D_800892D8[4];
extern u8 D_800E76B8[];
Unk800DD634 *func_800DD634(void);
Unk800895B8 *func_80032E00(s32, s32);
void func_800DD694(s32, s32, s32);
void func_800D6060(s32, void *, void *);

void func_800D01AC(Unk800D01AC *arg0) {
    Unk800DD634 *obj;
    Unk800895B8 *data;
    Unk800D01AC_74 *tbl;
    u32 i;

    obj = func_800DD634();
    tbl = &arg0->unk_74;
    tbl->count = 0xB5;
    for (i = 0; i < 0xB4; i++) {
        tbl->list[i] = 0;
    }
    tbl->list[i] = 0;
    data = func_80032E00(0, 0x134);
    *data = *D_800895B8;
    arg0->unk_30 = 0xFA;
    arg0->unk_60 = data;
    arg0->unk_2C = 0;
    arg0->unk_34 = 0x6A8;
    obj->unk_14.unk_0[0] = D_800892D8[0];
    obj->unk_14.unk_0[1] = D_800892D8[1];
    obj->unk_14.unk_0[2] = D_800892D8[2];
    obj->unk_14.unk_0[3] = D_800892D8[3];
    func_800DD694(0x48, 0x10, 8);
    func_800D6060(0x6A0, D_800E76B8, arg0);
}
