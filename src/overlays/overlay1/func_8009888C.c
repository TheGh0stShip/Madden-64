#include "types.h"

typedef struct {
    u8 pad00[0x20];
    s32 pos;
} Motion;

typedef struct {
    u8 pad00[0x24];
    Motion *motion;
} Object;

extern u16 D_8006B7A8;
extern s32 D_80080C10;
extern s16 D_8008712E;
extern s16 D_80088AE4;
extern s16 D_80089320;
extern Object *D_8008A058;

void func_80041DD4(s32, s32, s32);
void func_80041E4C(void);

void func_8009888C(void) {
    s32 height;

    if (D_8008712E == 0) {
        if ((height = D_80088AE4 == 0) && D_8008A058 != 0 && D_80089320 != 0 && (D_8008A058->motion->pos >> 20) >= 50) {
            func_80041DD4(0x3C, 0xF, 0xF0);
            D_8008712E = 2;
        }
    } else if (D_8008A058 != 0) {
        if (!(D_80080C10 & 0x4000) && D_8008712E == 1) {
            D_8008712E = 2;
            height = D_8008A058->motion->pos >> 20;
            if (height >= 50) {
                func_80041DD4(0x3C, 0xF, 0x12);
            } else {
                func_80041E4C();
                D_8008712E = 0;
            }
        }
        if (D_8006B7A8 != 0) {
            goto stop;
        }
    } else {
stop:
        func_80041E4C();
        D_8008712E = 0;
    }
}
