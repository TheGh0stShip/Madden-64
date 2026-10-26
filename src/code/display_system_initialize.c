#include "types.h"

extern u16 D_8007A9A4;
extern u16 D_800748FC[];
extern void func_8004486C(u16 context, u16 value, u16 index, u32 mode);
extern void func_80044744(u16 context, u16 index);
extern void func_800444D0(u16 index);
extern void func_8004211C(void);

void display_system_initialize(void)
{
    register u16 iteration __asm__("$17") = 0;
    register u16 *values __asm__("$18") = D_800748FC;
    register u16 index __asm__("$16");

    do {
        index = iteration;
        func_8004486C(D_8007A9A4, values[index], index, 3);
        iteration++;
        func_80044744(D_8007A9A4, index);
        func_800444D0(index);
    } while (iteration < 2);
    func_8004211C();
    D_8007A9A4 = 0;
}
