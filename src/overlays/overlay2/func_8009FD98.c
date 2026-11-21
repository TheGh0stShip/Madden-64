#include "types.h"

typedef struct {
    s32 unk0;
    s32 unk4;
    s32 unk8;
    u8 padC[0x180];
    u32 unk18C;
    u32 unk190;
    s32 unk194;
} Picker;

typedef struct {
    u8 pad0[0x60];
    Picker *unk60;
    u8 pad64[0x10];
    u8 unk74[1];
} Screen;

typedef struct {
    u8 unk0;
    u8 pad1[5];
} Slot6;

extern void func_8009E254(u32);
extern void func_800A0220(Picker *, void *);
extern void func_800A0348(Picker *, void *);
extern void func_800A047C(Picker *, void *);
extern void func_800A04FC(Picker *, void *);
extern void func_800A0588(void *, Picker *, u32, u32);
extern void func_800A06E4(void);
extern s16 func_800A1D20(void);
extern s16 func_800A1DA4(void);
extern s16 func_800A1E2C(void);
extern void func_800D6424(s32, s32, s32, s32);
extern void func_800DD658(void);
extern void func_800DF6EC(void);
extern void func_800DF72C(void);
extern s32 D_80072610[];
extern s32 D_80072618[];
extern u16 D_8008A5B4;
extern Slot6 D_800C4FC0[];

void func_8009FD98(Screen *arg0, s32 arg1, s16 arg2) {
    Picker *picker;
    s32 low;
    s32 high;
    s32 sel;
    void *sub;

    picker = arg0->unk60;
    low = func_800A1D20();
    high = func_800A1DA4();
    sel = func_800A1E2C();
    sub = arg0->unk74;
    switch (arg2) {
    case 2: {
        s32 stops[3] = { 2, 5, 6 };

        if (low < picker->unk18C) {
            if (picker->unk18C == stops[sel] && sel != 2) {
                func_800D6424(picker->unk0, D_80072610[picker->unk18C], 0, 10);
                func_800D6424(picker->unk4, D_80072610[picker->unk18C] + 0x153, 0, 10);
                func_800DD658();
                picker->unk8 = picker->unk0;
            }
            if (picker->unk194 == 0) {
                if (picker->unk18C == 6) {
                    func_800A047C(picker, sub);
                } else {
                    func_800A0220(picker, sub);
                }
            }
            func_800A0588(sub, picker, picker->unk18C, picker->unk18C - 1);
            func_800DF6EC();
            picker->unk18C--;
        }
        break;
    }
    case 3: {
        s32 stops[3] = { 1, 4, 6 };

        if (picker->unk18C < high) {
            if (picker->unk18C == stops[sel] && sel != 2) {
                func_800D6424(picker->unk0, D_80072618[picker->unk18C], 1, 10);
                func_800D6424(picker->unk4, D_80072618[picker->unk18C] + 0x153, 1, 10);
                func_800DD658();
                picker->unk8 = picker->unk4;
            }
            if (picker->unk194 == 0) {
                if (picker->unk18C == 6) {
                    func_800A047C(picker, sub);
                } else {
                    func_800A0220(picker, sub);
                }
            }
            func_800A0588(sub, picker, picker->unk18C, picker->unk18C + 1);
            func_800DF6EC();
            picker->unk18C++;
        }
        break;
    }
    case 8:
    case 28:
        if (D_800C4FC0[picker->unk18C].unk0 != 8) {
            func_800DF72C();
            func_8009E254(picker->unk18C);
            func_800A06E4();
        }
        break;
    case 12:
        func_800D6424(picker->unk0, 0xF0, 2, 10);
        func_800D6424(picker->unk4, 0xF0, 2, 10);
        break;
    }
    picker->unk190 = D_8008A5B4 + picker->unk190;
    if (picker->unk190 >= 30) {
        if (picker->unk194 == 0) {
            if (picker->unk18C == 6) {
                func_800A047C(picker, sub);
            } else {
                func_800A0220(picker, sub);
            }
        } else if (picker->unk194 == 1) {
            if (picker->unk18C == 6) {
                func_800A04FC(picker, sub);
            } else {
                func_800A0348(picker, sub);
            }
        }
    }
}
