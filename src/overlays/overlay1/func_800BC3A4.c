#include "types.h"

extern s32 D_800734F8;
extern s32 D_80085C08[];
extern u8 D_80086188;
extern u32 D_8008929C;
extern volatile u16 D_8008A5B4;
extern u16 D_8008AFD0;

void func_8003D464(s32 id);

void func_800BC3A4(void) {
    switch (D_8008929C) {
        case 0:
            break;
        case 1:
            if (D_800734F8 == -1) {
                D_80086188 = 0;
                D_8008929C = 2;
            }
            break;
        case 2:
            D_8008929C = 3;
            break;
        case 3:
            D_8008AFD0 = 0;
            D_8008929C = 4;
            break;
        case 4:
            D_8008AFD0 += D_8008A5B4;
            if (D_800734F8 == -1) {
                if (D_80085C08[D_80086188] == D_800734F8) {
                    D_8008929C = 0;
                } else {
                    func_8003D464(D_80085C08[D_80086188]);
                    D_80086188++;
                }
            }
            break;
    }
}
