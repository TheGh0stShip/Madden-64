#include "types.h"

#ifndef NULL
#define NULL 0
#endif

typedef struct {
    u8 pad00[0x30];
    s16 unk30;
} Target;

extern s32 D_80080C10;
extern s32 D_80084F50;
extern Target *D_80087B58;
extern s16 D_800894FC;
extern s32 D_80089520;
extern Target *D_8008A058;
extern volatile u16 D_8008A5B4;
extern s16 D_8008B62A;

s32 func_800A29C0(Target *);
void func_800C1EB8(void);
void func_800C20F0(s32);

void func_800C66CC(void) {
    s32 value;
    s16 none;
    s32 first;

    if ((D_80080C10 & 0x4000) && (D_800894FC == 0)) {
        if (D_8008A058 != NULL) {
            none = -1;
            if (D_80087B58 == D_8008A058) {
                if (D_8008B62A != none) {
                    D_8008B62A += D_8008A5B4;
                }
                value = func_800A29C0(D_8008A058);
                D_80089520 = value;
                if (D_8008A058->unk30 != 0) {
                    if (D_80084F50 < value) {
update:
                        func_800C20F0(value);
                    }
                } else {
                    if (D_8008B62A == none || D_8008B62A >= 6) {
                        goto update;
                    }
                    D_80084F50 = value;
                }
            } else {
                func_800C1EB8();
                D_80087B58 = D_8008A058;
                first = func_800A29C0(D_8008A058);
                D_80089520 = first;
                D_80084F50 = first;
            }
        } else if (D_80087B58 != NULL) {
            func_800C1EB8();
        }
    }
}
