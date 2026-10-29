#include "types.h"

extern void func_800DBFA8(void);
extern s8 D_8008B310[];
extern s8 D_8008B31A;
extern s8 D_8008B320[];
extern s8 D_800894B8[];
extern s8 D_800894C0;
extern s8 D_800894C1;
extern s8 D_800894C2;

void func_800CF320(void) {
    s8 i;
    s8 k;
    s8 sel = 0;
    s8 v;
    s8 a, b;
    func_800DBFA8();
    a = D_8008B310[0];
    b = D_8008B31A;
    for (i = 0; i < 11; i++) {
        if (D_8008B320[i] == a) {
            continue;
        }
        if (D_8008B320[i] == b) {
            continue;
        }
        sel = D_8008B320[i];
        break;
    }
    k = 7;
    for (i = 1; i < 10; i++) {
        v = D_8008B310[i];
        if (v != sel) {
            D_800894B8[k--] = v;
        }
    }
    D_800894C0 = a;
    D_800894C1 = sel;
    D_800894C2 = b;
}
