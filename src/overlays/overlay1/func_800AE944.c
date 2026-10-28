#include "types.h"

#ifndef NULL
#define NULL 0
#endif

s32 func_8000D834(s32, s32);                    /* extern */
s32 func_8000D874(s32, s32);                    /* extern */
s32 func_8002FFEC(s32 *);                   /* extern */
s32 func_80032F3C(s32, s32);                /* extern */
s32 func_80033360(s32);                         /* extern */
s32 func_8003E23C(s32 *);                   /* extern */
s32 func_800AADA8(s16);                         /* extern */
s32 func_800AE700();                            /* extern */
extern s32 D_8006B8F8;
extern s32 D_8006B8FC;
extern s32 D_8006B900;
extern s32 D_8006B948;
extern s32 D_8006B988;
extern s32 D_8006B9D4;
extern s32 D_80072770;
extern s32 D_8008931C;
extern s32 D_80089344;
extern u16 D_8008A71C;
extern s32 D_8008B20C;
extern s16 D_8008B258;
extern s32 D_800AE774;

void func_800AE944(void) {
    s32 *handle = &D_8006B988;

    func_8000D834(D_8008931C, *handle);
    *handle = 0;
    D_80072770 = 0;
    func_800AADA8(D_8008B258);
    if (!(D_8008A71C & 1)) {
        func_8000D874(D_8006B8F8, D_8006B900);
    }
    func_800AE700();
    func_8002FFEC(&D_800AE774);
    func_8000D834(D_8008931C, D_8006B900);
    func_8003E23C(&D_8006B948);
    D_8006B8FC = 0;
    D_8006B900 = 0;
    D_8006B8F8 = 0;
    func_80033360(D_80089344);
    func_80033360(D_8008B20C);
    if (D_8006B9D4 != 0) {
        func_80032F3C(0, D_8006B9D4);
    }
    D_8006B9D4 = 0;
}
