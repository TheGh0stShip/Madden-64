#include "types.h"

extern s16 D_80072730[];
extern s16 D_80080C20;
extern u16 D_8008A71C;
extern s16 D_8008B33C;

u16 func_80016FD4(void);
void func_8002FFEC(void (*)(void));
void func_8003647C(u16, s16);
s32 func_800364E4(u16, s16);
void func_800BE300(void);

/* State machine for a sound stream; re-registers itself as the per-frame callback when it finishes. */
void func_800C2D68(void) {
    switch (D_80080C20) {
        case 2:
            if (func_800364E4(func_80016FD4(), D_80072730[D_8008B33C]) < 0) {
                D_8008A71C &= 0xFFFD;
                func_800BE300();
                D_80080C20 = 3;
                func_8002FFEC(func_800C2D68);
            }
            break;
        case 1:
            if (!(D_8008A71C & 2)) {
                D_80080C20 = 2;
                func_8003647C(func_80016FD4(), D_80072730[D_8008B33C]);
                D_8008A71C |= 2;
            }
            break;
        case 4:
            func_800BE300();
            D_80080C20 = 0;
            func_8002FFEC(func_800C2D68);
            break;
    }
}
