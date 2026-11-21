#include "types.h"

extern u16 D_8006B7A8;
extern s32 D_80080C10;
extern s8 D_80084F70;
extern s32 D_80085298;
extern s16 D_800857C0;
extern u16 D_800857C4;
extern u16 D_800857C6;
extern u16 D_80086D6C;
extern s32 D_80087A64;
extern u16 D_800886E0;
extern u16 D_80088AE4;
extern s16 D_800892C8;
extern s16 D_80089320;
extern s16 D_800894FC;
extern volatile u16 D_8008A5B4;
extern s32 D_8008A6C4;
extern s16 D_8008B674;

void func_80094030(void);
void func_800B7C80(void);
void func_800BAA80(void);
void func_800A6F2C(void);
void func_800B0D10(void);
void func_8008CEA4(u16);
void func_800D52D4(void);
void func_80041A40(void);
s16 func_8002098C(void);
s16 func_8002099C(void);
void func_8009CA5C(s32, s32);
s16 func_800AEAAC(void);
s16 func_800AE9A4(void);
s32 func_8009CA08(void);
void runtime_limit_latch(void);
void func_800905F4(void);
s32 func_800397C8(u16, u16);
void func_800AE5C4(u16);
void func_800AEA48(void);
void func_800AD404(void);
void conditional_runtime_cleanup(void);
void primary_handle_release(void);
void secondary_handle_release(void);
void func_800AEA9C(s32);
void func_80094168(void);
void func_8009198C(void);
void func_800AB4E0(void);
void func_80092FDC(void);
void func_8008D654(void);
void func_800AA370(void);
void func_800B20C0(void);
void func_8000DC7C(s32);
void conditional_runtime_update(void);
void func_800BE9E0(void);
void func_800CA6F8(void);
void func_800CD13C(void);
void func_800C1FA8(void);
void func_80030110(void);
void func_800BCFBC(void);
void func_8003456C(s32, u16);
void func_8000BF08(void);
void func_80094288(void);

void func_800911B0(void) {
    s16 result;

    D_8008A6C4 = D_8008A5B4 + D_8008A6C4;
    func_80094030();
    func_800B7C80();
    func_800BAA80();
    func_800A6F2C();
    if (!(D_80086D6C & 4)) {
        func_800B0D10();
        func_8008CEA4(D_80088AE4);
        func_8008CEA4(D_800886E0);
    }
    func_800D52D4();
    func_80041A40();
    func_800B7C80();
    if (D_800894FC != 0 && D_8006B7A8 == 0) {
        D_800894FC -= D_8008A5B4;
        if (D_800894FC <= 0) {
            result = func_8002098C();
            if (result == 1 && func_8002099C() != result) {
                D_800894FC = 0;
                func_8009CA5C(0x2D, 0xD2);
            } else if (func_800AEAAC() == 0 && func_800AE9A4() == 0) {
                if (D_80084F70 == 1 || func_8009CA08() != 0) {
                    runtime_limit_latch();
                }
                func_800905F4();
                if (D_80089320 != -1 && D_800857C0 == 1 && D_800857C4 < 2 && D_800857C6 < 55) {
                    func_800AE5C4(func_800397C8(D_800857C4, D_800857C6));
                }
            } else {
                if (func_800AEAAC() == 0) {
                    func_800AEA48();
                }
                D_800894FC = 1;
                if (D_8008B674 > 0) {
                    D_8008B674 -= D_8008A5B4;
                    if (D_8008B674 < 16) {
                        func_800AD404();
                        conditional_runtime_cleanup();
                        primary_handle_release();
                        secondary_handle_release();
                    }
                    if (D_8008B674 <= 0) {
                        func_800AEA9C(0);
                    }
                }
            }
        } else if (D_8008B674 > 0) {
            D_8008B674 -= D_8008A5B4;
            if (D_8008B674 <= 0) {
                D_8008B674 = 15;
            }
        }
    }
    func_800B7C80();
    func_80094168();
    if (D_800892C8 != 0) {
        if (D_8006B7A8 == 0) {
            if (--D_800892C8 == 0 && func_8002098C() == 0) {
                func_8009198C();
                func_800AB4E0();
            }
        }
        func_80092FDC();
    }
    if (!(D_80080C10 & 0x4000)) {
        func_8008D654();
    }
    if (D_80080C10 & 0x800) {
        func_80092FDC();
    }
    func_800B7C80();
    func_800AA370();
    func_800B20C0();
    func_8000DC7C(D_80087A64);
    conditional_runtime_update();
    func_800BE9E0();
    func_800CA6F8();
    func_800CD13C();
    func_800C1FA8();
    func_80030110();
    func_800BCFBC();
    func_8003456C(D_80085298, D_8008A5B4);
    func_8003456C(D_80087A64, D_8008A5B4);
    func_8000BF08();
    func_80094288();
}
