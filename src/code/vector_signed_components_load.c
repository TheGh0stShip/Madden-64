#include "types.h"

extern s8 D_80078418[];
extern s8 D_80078419;
extern s8 D_8007841A;
extern s8 D_8007841C;
extern s8 D_8007841D;
extern s8 D_8007841E;
extern s8 D_80078429[];
extern s8 D_8007842A[];

void vector_signed_components_load(s8 *components) {

    D_80078418[0] = D_8007841C = components[0] < 0 ? 0 : components[0];
    D_80078419 = D_8007841D = components[1] < 0 ? 0 : components[1];
    D_8007841A = D_8007841E = components[2] < 0 ? 0 : components[2];
    D_80078418[0x10] = D_80078418[0x10] = components[0] > 0 ? 0 : -components[0];
    *D_80078429 = *D_80078429 = components[1] > 0 ? 0 : -components[1];
    *D_8007842A = *D_8007842A = components[2] > 0 ? 0 : -components[2];
}
