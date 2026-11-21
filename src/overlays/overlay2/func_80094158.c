#include "types.h"

typedef struct {
    s32 unk_00;
    s16 unk_04;
    s16 unk_06;
    s16 unk_08;
    u8 pad0A[2];
    s32 unk_0C;
    u8 pad10[4];
    void *unk_14;
    u8 pad18[0x10];
} ObjectSpec94158;

typedef struct {
    u8 pad00[0x14];
    s32 unk_14;
} Object94158;

extern s32 D_80088090;
extern Object94158 *D_80071964;
extern Object94158 *D_80071970;
extern s16 D_8007A25C;
extern void *D_800892D8[];
extern void *D_800892DC;
extern void *D_800892E0;
extern void *D_800892E4;
extern void *D_800892E8;
extern void *D_800892EC;
extern void *D_800892F0;
extern void *D_800892F4;
extern void *D_800892F8;

void func_8001F5D4(void);
s32 func_8000C8A0(s32 value);
Object94158 *func_8000D740(s32 value, s32 flags, ObjectSpec94158 *spec);
void *func_8000D8DC(s32 flags, ObjectSpec94158 *spec);
void func_80016FF4(Object94158 *object);
void func_80016FE4(void *object);
void func_80017CDC(Object94158 *object, s32 value);
void func_8001AA3C(Object94158 *object, s32 value);

void func_80094158(void) {
    ObjectSpec94158 spec;

    func_8001F5D4();
    spec.unk_00 = 0x8E;
    spec.unk_0C = 0x100;
    spec.unk_04 = 2;
    spec.unk_06 = 0x13;
    spec.unk_08 = 0x10;
    D_80071964 = func_8000D740(func_8000C8A0(D_80088090), 0, &spec);
    D_80071964->unk_14 = 0;
    func_80016FF4(D_80071964);
    func_80017CDC(D_80071964, 1);
    func_8001AA3C(D_80071964, 0xF0);

    spec.unk_06 = 0;
    spec.unk_08 = 0x2D;
    spec.unk_00 = 0x1A;
    spec.unk_06 = 0xC;
    spec.unk_0C = 0;
    spec.unk_04 = 9;
    spec.unk_08 = 0;
    D_80071970 = func_8000D740(func_8000C8A0(D_80088090), 0, &spec);
    func_80016FF4(D_80071970);

    D_8007A25C = 1;
    spec.unk_00 = 0x1B;
    spec.unk_0C = 0;
    spec.unk_04 = 4;
    spec.unk_06 = 0;
    spec.unk_08 = 0;
    D_800892D8[0] = func_8000D8DC(0, &spec);
    func_80016FE4(D_800892D8[0]);
    spec.unk_00 = 0x1C;
    D_800892DC = func_8000D8DC(0, &spec);
    func_80016FE4(D_800892DC);
    spec.unk_00 = 3;
    D_800892E0 = func_8000D8DC(0, &spec);
    func_80016FE4(D_800892E0);
    spec.unk_00 = 4;
    D_800892E4 = func_8000D8DC(0, &spec);
    func_80016FE4(D_800892E4);
    spec.unk_00 = 0x7E;
    D_800892F8 = func_8000D8DC(0, &spec);
    func_80016FE4(D_800892F8);

    spec.unk_0C = 0x20;
    spec.unk_14 = D_800892D8[0];
    D_800892E8 = func_8000D8DC(0, &spec);
    func_80016FE4(D_800892E8);
    spec.unk_14 = D_800892DC;
    D_800892EC = func_8000D8DC(0, &spec);
    func_80016FE4(D_800892EC);
    spec.unk_14 = D_800892E0;
    D_800892F0 = func_8000D8DC(0, &spec);
    func_80016FE4(D_800892F0);
    spec.unk_14 = D_800892E4;
    D_800892F4 = func_8000D8DC(0, &spec);
    func_80016FE4(D_800892F4);
}
