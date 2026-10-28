#include "types.h"

extern u16 D_8006B7A8;
extern u16 D_80085280;
extern u16 D_800857B2;

void func_800A6FDC(s32, u16);
void func_800A7AB0(void);
void func_800A8020(void);
void func_800A80E4(void);
void func_800A82E8(void);
void func_800A8F88(void);

void func_800AB650(void) {
    switch (D_8006B7A8) {
        case 0:
            return;
        case 1:
            func_800A7AB0();
            break;
        case 2:
            func_800A6FDC(0, D_80085280);
            func_800A6FDC(1, D_800857B2);
            func_800A8F88();
            break;
        case 3:
            func_800A8020();
            break;
        case 4:
            func_800A80E4();
            break;
    }
    func_800A82E8();
}
