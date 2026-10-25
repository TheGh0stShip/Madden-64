#include "types.h"

extern void *D_8007A268;
extern s16 D_8007A26C;

extern void *func_80032E00(s32 type, s32 size);
extern void func_800B7A58(void);
extern void func_800B7A48(void);

void workspace_initialize(void)
{
    D_8007A268 = func_80032E00(0, 0x600);
    func_800B7A58();
    func_800B7A48();
    D_8007A26C = 0;
}
