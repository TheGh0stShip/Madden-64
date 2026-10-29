#include "types.h"

extern s8 D_800C4AD2;
extern s8 D_80072038[];
extern s8 D_80072040[];

s8 func_8009CC68(s32 index) {
    if (D_800C4AD2 == 4) {
        return D_80072038[index];
    }
    return D_80072040[index];
}
