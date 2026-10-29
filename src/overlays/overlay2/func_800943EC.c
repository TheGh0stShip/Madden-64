#include "types.h"

#ifndef NULL
#define NULL 0
#endif

s32 func_8000BE80();                            /* extern */
s32 func_8000C8A0(s32);                             /* extern */
s32 func_8000D998(s32, s32);                    /* extern */
s32 func_8000DA98(s32);                         /* extern */
s32 func_8001F70C();                            /* extern */
extern s32 D_80071964;
extern s32 D_80071970;
extern s32 D_80088090;
extern s32 D_800892D8;
extern s32 D_800892DC;
extern s32 D_800892E0;
extern s32 D_800892E4;
extern s32 D_800892E8;
extern s32 D_800892EC;
extern s32 D_800892F0;
extern s32 D_800892F4;
extern s32 D_800892F8;

void func_800943EC(void) {
    func_8000BE80();
    func_8001F70C();
    if (D_80071970 != 0) {
        func_8000D998(func_8000C8A0(D_80088090), D_80071970);
        D_80071970 = 0;
    }
    func_8000D998(func_8000C8A0(D_80088090), D_80071964);
    D_80071964 = 0;
    func_8000DA98(D_800892D8);
    func_8000DA98(D_800892DC);
    func_8000DA98(D_800892E0);
    func_8000DA98(D_800892E4);
    func_8000DA98(D_800892F8);
    func_8000DA98(D_800892E8);
    func_8000DA98(D_800892EC);
    func_8000DA98(D_800892F0);
    func_8000DA98(D_800892F4);
}
