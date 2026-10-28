#include "types.h"

extern u16 D_8007A9A4;
extern u16 D_800748FC[];
extern void *D_8007A558;
extern void *D_8007A998;
extern void func_80035F88(u16 value, s32 count);
extern void func_8004486C(u16 value, u16 entry, u16 outer, u16 inner);
extern void func_80044744(u16 value, u16 index);
extern void func_800444D0(u16 index);
extern void func_8004211C(void);
extern void func_80032F3C(s32 unused, void *pointer);

void menu_resources_release(void)
{
    u32 outer;
    u16 *entry;

    func_80035F88(D_8007A9A4, 6);
    outer = 0;
    entry = D_800748FC;
    do {
        u32 inner = 0;
        do {
            func_8004486C(D_8007A9A4, *entry, outer, inner);
            inner++;
        } while (inner < 4);
        func_80044744(D_8007A9A4, outer);
        entry++;
        func_800444D0(outer);
        outer++;
    } while (outer < 4);

    func_8004211C();
    D_8007A9A4 = 0;
    func_80032F3C(0, D_8007A558);
    func_80032F3C(0, D_8007A998);
}
