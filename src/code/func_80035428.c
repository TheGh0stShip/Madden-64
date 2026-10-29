#include "types.h"

typedef struct {
    s32 a;
    s32 b;
    u8 pad[0x10];
} Slot35428;

s32 func_80033174(s32, u16, s32);
void func_80033258(s32);
void func_80033308(s32, void *, s32, s32);
void func_80035A7C(u16);
extern s8 D_800712F8;
extern s32 D_80071304;
extern s32 D_80071308;
extern s32 D_800724E0;
extern s32 D_800724EC;
extern s32 D_800734E8;
extern s32 D_8007A500;
extern s32 D_800895E0;
extern Slot35428 D_8008B078[];

void func_80035428(u16 arg0) {
    u16 i;

    D_800712F8 = 0;
    D_800895E0 = 0;
    if (D_800724EC == 0) {
        D_80071304 = 0;
        D_80071308 = 0;
        D_8007A500 = 0;
        func_80033308(0, D_8008B078, 0x180, 0);
        D_800724EC = 1;
    }
    for (i = 0; i < 0x10; i++) {
        if (D_8008B078[i].a == -1) {
            func_80035A7C(i | 0x4000);
        } else if (D_8008B078[i].b == -1) {
            func_80035A7C(i | 0x8000);
        } else {
            func_80035A7C(i);
        }
    }
    if (D_800724E0 != 0) {
        func_80033258(D_800724E0);
        D_800724E0 = 0;
    }
    D_800724E0 = func_80033174(0, arg0, 0x18);
    D_800734E8 = 0;
}
