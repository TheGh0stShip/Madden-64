#include "types.h"

extern s32 D_80088780;
extern s32 D_80088784;
extern s32 D_80088788;
extern s32 D_8008878C;
extern s32 D_80088790;
extern s32 D_80088794;
extern u32 *D_80084F5C;

void display_convert_coefficients_set(s32 k0, s32 k1, u32 k2,
                                      s32 k3, s32 k4, s32 k5)
{
    if (D_80088780 != k0 ||
        D_80088784 != k1 ||
        D_80088788 != k2 ||
        D_8008878C != k3 ||
        D_80088790 != k4 ||
        D_80088794 != k5) {
        u32 *command = D_80084F5C;

        D_80084F5C = command + 2;
        command[0] = 0xEC000000 | ((k0 & 0x1FF) << 13) |
                     ((k1 & 0x1FF) << 4) | ((k2 >> 5) & 0xF);
        command[1] = (k2 << 27) | ((k3 & 0x1FF) << 18) |
                     ((k4 & 0x1FF) << 9) | (k5 & 0x1FF);
        D_80088780 = k0;
        D_80088784 = k1;
        D_80088788 = k2;
        D_8008878C = k3;
        D_80088790 = k4;
        D_80088794 = k5;
    }
}
