#include "types.h"

extern u16 D_8006B890;
extern u16 D_8006B892;
extern u16 D_8006B894;
extern u16 D_8006B896;
extern u16 D_8006B898;
extern u16 D_8006B89A;
extern u16 D_8006B89C;
extern u16 D_8006B89E;
extern u16 D_8006B8A0;
extern u16 D_8006B8A2;
extern u16 D_8006B8A4;
extern u16 D_8006B8A6;
extern u16 D_8006B8A8;
extern u16 D_8006B8AA;
extern u16 D_8006B8AC;
extern u16 D_8006B8AE;

void func_800ACA0C(void) {
    u16 *first_slot;
    u16 *second_slot;
    u16 first;

    first_slot = &D_8006B890;
    second_slot = &D_8006B8A0;
    first = *first_slot;
    *first_slot = D_8006B892;
    D_8006B892 = D_8006B894;
    D_8006B894 = D_8006B896;
    D_8006B896 = D_8006B898;
    D_8006B898 = D_8006B89A;
    D_8006B89A = D_8006B89C;
    D_8006B89C = D_8006B89E;
    D_8006B89E = first;

    first = *second_slot;
    *second_slot = D_8006B8A2;
    D_8006B8A2 = D_8006B8A4;
    D_8006B8A4 = D_8006B8A6;
    D_8006B8A6 = D_8006B8A8;
    D_8006B8A8 = D_8006B8AA;
    D_8006B8AA = D_8006B8AC;
    D_8006B8AC = D_8006B8AE;
    D_8006B8AE = first;
}
