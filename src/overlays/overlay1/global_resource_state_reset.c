#include "types.h"

extern void *D_80071934;
extern s32 D_80071938;
extern u8 D_80071948;
extern u8 D_80071949;

extern void func_80033258(void *resource);

void global_resource_state_reset(void)
{
    void **resource = &D_80071934;

    func_80033258(*resource);
    *resource = 0;
    D_80071938 = 0;
    D_80071949 = 0;
    D_80071948 = 0;
}
