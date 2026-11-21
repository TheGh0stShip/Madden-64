#include "types.h"

extern s16 *D_8008B25C;
extern u8 D_8006BE64[];
extern u8 D_8006BFA0[];
extern s16 D_80072148;
extern s16 D_80072154;
extern u16 D_8007A2CC[];
extern s16 D_8008A6C2;


u8 *func_80022A3C(u16, u16);
void func_8002E65C(void *, void *);
void func_800D39FC(s16, s32 *, s16, void *, s32);

extern s32 *D_8008AF74;

void func_800CA194(u32 index, u32 sub, void *dest) {
    if (sub == 0) {
        if (D_8008B25C[400] == 0) {
            if (index == 0) {
                func_8002E65C(dest, D_8006BE64);
            } else {
                func_8002E65C(dest, D_8006BFA0);
            }
        } else if (index < D_8008B25C[400]) {
            func_8002E65C(dest, func_80022A3C(D_8007A2CC[D_80072154], D_8008B25C[index * 2 + 1]));
        } else {
            func_8002E65C(dest, D_8006BFA0);
        }
    } else if (index >= D_8008B25C[400] || sub > D_8008A6C2) {
        func_8002E65C(dest, D_8006BFA0);
    } else {
        func_800D39FC(D_8008B25C[index * 2 + 1], &D_8008AF74[(D_80072148 + sub) * 2 + 1],
                      D_8007A2CC[D_80072154], dest, 0);
    }
}
