#include "types.h"

typedef struct {
    u8 unk_00[0x28];
    s32 unk_28;
} Sub08;

typedef struct {
    u8 unk_00[0x8];
    Sub08 *unk_08;
    void *unk_0C;
    u8 unk_10[0x4];
    s32 unk_14;
    u8 unk_18[0x24];
    s16 unk_3C;
} Obj;

typedef struct {
    u8 unk_00[0x28];
    Obj *unk_28;
} Request;

Obj *func_8000D740(s32, s32, Request *);
void func_80033B20(Obj *, s32);
void func_80034388(Obj *, s32);
void func_800950E0(Obj *, s32);
void func_80096A00(Obj *, u16);
void object_table_value_apply(Obj *);
void func_800BCB74(void);
extern Request D_80069AB8;
extern Obj *D_80086C40[9];
extern Obj *D_8008794C;
extern s32 D_80087A64;
extern Obj *D_80088490[5];
extern s16 D_80089308[9];
extern u16 D_8008B1F8[];

void func_800BC428(void) {
    s32 i;

    D_80069AB8.unk_28 = 0;
    for (i = 0; i < 9; i++) {
        if (i == 8) {
            D_80069AB8.unk_28 = 0;
        }
        D_80086C40[i] = func_8000D740(D_80087A64, 0xB, &D_80069AB8);
        func_800950E0(D_80086C40[i], 1);
        D_80086C40[i]->unk_08->unk_28 = 0x500;
        func_80034388(D_80086C40[i], 0x105);
        if (i == 8) {
            func_80034388(D_80086C40[8], 0x106);
        }
        if (i == 0) {
            D_80069AB8.unk_28 = D_80086C40[0];
            func_80033B20(D_80086C40[0], 1);
            object_table_value_apply(D_80086C40[0]);
        }
        func_80096A00(D_80086C40[i], D_8008B1F8[D_80089308[i]]);
        D_80086C40[i]->unk_0C = func_800BCB74;
        D_80086C40[i]->unk_14 &= ~1;
        D_80086C40[i]->unk_3C = i;
    }
    for (i = 0; i < 5; i++) {
        object_table_value_apply(D_80088490[i]);
    }
    object_table_value_apply(D_8008794C);
}
