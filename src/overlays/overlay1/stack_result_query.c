#include "types.h"

extern void func_800A289C(void *context, s32 *primary, s32 *secondary);

s32 stack_result_query(void *context)
{
    s32 primary[4];
    s32 secondary[2];

    func_800A289C(context, primary, secondary);
    return primary[1];
}
