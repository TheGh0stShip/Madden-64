#include "types.h"

extern u16 D_80088472;
extern void *D_8006B9D4;

extern u16 func_80031A1C(u16 resource_id);
extern void func_800363F4(u16 value, s32 index, void *context);
extern void func_80090C9C(void);

void resource_index_dispatch(void)
{
    u16 index = func_80031A1C(5);

    func_800363F4(D_80088472, index + 2, D_8006B9D4);
    func_80090C9C();
}
