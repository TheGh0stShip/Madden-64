#include "types.h"

extern u16 D_8006B7AA;
extern s16 D_80089320;
extern s16 D_800880B0;
extern u16 D_800880C4;
extern s16 D_80088AE4;

void func_8004192C(s32);
void func_80041DD4(s32, s32, s32);
void func_80041E54(s32);

void func_800A710C(void) {
    if (D_8006B7AA == 0x13 || D_8006B7AA == 0x14) {
        if (D_80089320 == 0) {
            if (D_800880B0 == 0) {
                if (D_80088AE4 == 0) {
                    func_80041DD4(0x3B, 0xF, 0xF0);
                }
            } else if (D_80088AE4 == 0) {
                func_80041E54(0xC);
            } else {
                func_8004192C(1);
            }
        } else if (D_800880C4 & 8) {
            if (D_80088AE4 == 0) {
                func_80041DD4(0x3A, 0xF, 0x78);
            }
        } else if (D_80088AE4 == 0) {
            func_80041E54(0xC);
        } else {
            func_8004192C(1);
        }
    }
    if (D_8006B7AA == 0x18 || D_8006B7AA == 0x19) {
        if (D_80089320 == 0) {
            if (D_800880B0 == 0) {
                if (D_80088AE4 == 0) {
                    func_80041DD4(0x3B, 0xF, 0xF0);
                }
            } else if (D_80088AE4 == 0) {
                func_80041E54(0xC);
            } else {
                func_8004192C(1);
            }
        } else if (D_800880C4 & 8) {
            if (D_80088AE4 == 0) {
                func_80041DD4(0x3A, 0xE, 0xF0);
            } else {
                func_8004192C(1);
            }
        } else if (D_80088AE4 == 0) {
            func_80041E54(0xC);
        } else {
            func_80041DD4(0x3A, 0xE, 0x78);
        }
    }
}
