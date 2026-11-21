#include "types.h"

typedef struct {
    /* 0x00 */ s32 unk_00;
    /* 0x04 */ u8 pad_04[0x14];
    /* 0x18 */ s32 unk_18;
    /* 0x1C */ s32 unk_1C;
    /* 0x20 */ s32 unk_20;
} Menu;

s32 func_80011238(void);
u8 func_800A6580(void);
void func_800DFAF8(s32 a, void *b, s32 c);
void overlay5_runtime_object_construct(s32 a, Menu *menu, void *c);

extern u16 D_80064A4A;
extern s32 D_800696D8;
extern u8 D_800717F8;
extern u8 D_800718F8;
extern s8 D_800724A8;
extern s16 D_800740CA;
extern s16 D_800740E0;
extern u8 D_80074808;
extern s32 D_80080C10;
extern s16 D_80087A68;
extern u8 D_80087A94;
extern s16 D_80087AC2;
extern s32 D_80089490[];
extern u8 D_8008AFC6;
extern u8 D_800E6FB9;
extern u8 D_800E6FD1;
extern u8 D_800E7001;
extern u8 D_800E7009;
extern u8 D_800E7011;
extern u8 D_800E7029;
extern u8 D_800E7051;
extern u8 D_800E7069;
extern u8 D_800E7081;
extern u8 D_800E7099;
extern u8 D_800E7120[];
extern u8 D_800E7130[];
extern u8 D_800E7140[];
extern u8 D_800E7170[];

void func_800CA604(Menu *menu) {
    s32 i;

    menu->unk_18 = 0x460;
    menu->unk_1C = 0;
    menu->unk_20 = 0x14A;
    D_800E6FB9 = D_80064A4A;
    D_800E6FD1 = D_8008AFC6;
    D_800E7001 = D_800740E0 != 0;
    D_800E7029 = D_800724A8 != 0;
    D_800E7069 = D_800740CA != 0;
    D_800E7009 = D_80087A94 != 0 && D_80087A68 != 1;
    D_800E7011 = D_800696D8 != 0;
    switch (D_80087AC2) {
    case 0:
        D_800E7051 = 0;
        break;
    case 1:
        D_800E7051 = 1;
        break;
    case 2:
        D_800E7051 = 3;
        break;
    case 3:
        D_800E7051 = 2;
        break;
    }
    D_800E7081 = D_800718F8 != 0;
    D_800E7099 = D_80074808;
    overlay5_runtime_object_construct(0x458, menu, D_800E7170);
    for (i = 0; D_80089490[i] != -1; i++) {
    }
    if (i != 1 || (D_80080C10 & 0x4000)) {
        func_800DFAF8(menu->unk_00, D_800E7120, 0);
    }
    if (D_800717F8 != 0 || func_800A6580() == 9) {
        func_800DFAF8(menu->unk_00, D_800E7140, 0);
    }
    if (func_80011238() == -1 || D_80087A68 == 1) {
        func_800DFAF8(menu->unk_00, D_800E7130, 0);
        D_800E7009 = 0;
    } else {
        func_800DFAF8(menu->unk_00, D_800E7130, 1);
    }
}
