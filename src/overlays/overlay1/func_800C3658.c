#include "types.h"

extern s32 D_80086178;
extern s32 D_80086CE8;
extern u8 D_800878C8[];
extern s8 D_80087928[];
extern s32 D_80089490[];
extern s8 D_80089514;
extern s8 D_8008951A;
extern s16 D_80089598[];
extern s8 D_8008AFC6;

void func_800A2E4C(s32 *, s32);
void func_800BEE28(void);

void func_800C3658(void) {
    s16 i;
    u8 id;

    if (D_80089514 == 1) {
        i = 0;
        if (D_800878C8[0] != 0xFF) {
            do {
                id = D_800878C8[i];
                D_80089490[i] = id;
                D_80089598[id] = D_80087928[id];
                i++;
            } while (D_800878C8[i] != 0xFF);
        }
        D_80089490[i] = -1;
        D_80089514 = 0;
        if (i != 1) {
            D_8008AFC6 = 0;
            D_8008951A = 0;
            func_800A2E4C(&D_80086CE8, D_80086178);
        }
        func_800BEE28();
    }
}
