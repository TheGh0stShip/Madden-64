#include "types.h"

#ifndef NULL
#define NULL 0
#endif

s32 func_80016FF4(s32);                         /* extern */
extern s32 D_80086CCC;
extern s32 D_80086CD0;
extern s32 D_80086CD4;
extern s32 D_80086CD8;
extern s32 D_80087130;

void func_80094AB0(void) {
    func_80016FF4(D_80087130);
    func_80016FF4(D_80086CCC);
    func_80016FF4(D_80086CD0);
    func_80016FF4(D_80086CD4);
    func_80016FF4(D_80086CD8);
}
