#include "types.h"

extern void* D_800748E8;
extern u16 D_8007A9A4;
extern void func_80033258(void* resource);
extern void func_80035F88(u16 channel, u16 command);

void func_8004211C(void) {
    if (D_800748E8 != 0) {
        func_80033258(D_800748E8);
        D_800748E8 = 0;
    }
    func_80035F88(D_8007A9A4, 0x40);
    func_80035F88(D_8007A9A4, 0x3F);
}
