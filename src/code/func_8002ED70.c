#include "types.h"

void func_800218D4(s32, s32);
void func_800334B8(void);
void func_8003C7E4(s32, s32);
extern s32 D_80085138[];
extern s32 D_80086DD8;
extern s32 D_80088D2C;
extern s32 D_800892AC;
extern u32 D_8008B260;

void func_8002ED70(void) {
    u32 i;
    u32 n;

    func_8003C7E4(0, 3);
    n = D_8008B260;
    for (i = 0; i < n; i++) {
    }
    D_80085138[D_8008B260] = -1;
    for (i = 0; i < D_8008B260; i++) {
        if (D_80085138[i] == 6) {
            func_800218D4(3, 0);
        }
        if (D_80085138[i] == 5) {
            func_800218D4(2, 0);
        }
    }
    D_8008B260 = 0;
    func_800334B8();
    func_8003C7E4(0, D_800892AC);
    D_80086DD8 = D_80088D2C;
}
