#include "types.h"

extern void *D_8007A268;
extern s32 D_8007A270;
extern u8 D_8007A274;
extern void func_80032F3C(s32 value, void *table);
extern void func_800B7A50(void);

void resource_table_reset(void)
{
    func_80032F3C(0, D_8007A268);
    D_8007A268 = 0;
    func_800B7A50();
    D_8007A274 = 0;
    D_8007A270 = 0;
}
