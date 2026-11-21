#include "types.h"

typedef struct {
    u8 unk_00[4];
    s16 unk_04;
    u8 unk_06[2];
    s16 unk_08;
    u8 unk_0A[0x3E];
    s32 unk_48;
} Obj;

extern volatile u16 D_8008A5B4;
extern s32 D_80085298;
extern s32 D_80088620;

void func_80030A28(void);
void func_8003456C(s32, u16);
void func_8000BF08(void);
void func_80030110(void);
void func_80030050(void);
void func_800B7C80(void);
u16 func_80031964(void);
void func_80030B9C(s32, s32 *);
void func_800E0388(s32, Obj *, s32);

void func_800E0218(Obj *obj, s32 arg1) {
    s32 i;
    s32 value;
    u16 r;

    func_80030A28();
    i = 2;
    do {
        func_8003456C(D_80085298, D_8008A5B4);
        func_8000BF08();
        func_80030110();
        func_80030050();
        func_800B7C80();
    } while (i--);
    func_8003456C(D_80085298, D_8008A5B4);
    func_8000BF08();
    func_80031964();
    if (obj->unk_04 == 1) {
        func_80030B9C(obj->unk_08, &value);
        func_800E0388(value, obj, arg1);
    } else {
        obj->unk_48 -= D_8008A5B4;
        if (obj->unk_48 <= 0) {
            func_800E0388(0x8000, obj, arg1);
            obj->unk_48 = 180;
        } else if (D_80088620 & 0x40) {
            r = func_80031964();
            if (r < 0x5555) {
                func_800E0388(0x800, obj, arg1);
            } else if (r <= 0xAAA9) {
                func_800E0388(0x400, obj, arg1);
            } else {
                func_800E0388(0x8000, obj, arg1);
            }
        }
    }
    func_80030110();
    func_80030050();
    func_800B7C80();
}
