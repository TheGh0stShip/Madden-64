#include "types.h"

extern u16 D_80069DB8[][2];
extern u16 D_80089480[3][2];

void func_800DC95C(u16 idx, u16 *out) {
    out[0] = D_80069DB8[idx][1];
    if (idx < 4) {
        out[1] = D_80089480[0][0];
    } else if (idx < 13) {
        out[1] = D_80089480[1][0];
    } else {
        out[1] = D_80089480[2][0];
    }
}
