#include "types.h"

extern u8 D_80087740[];
extern void func_800167FC(s16 index, void *buffer);

void *global_buffer_prepare(s16 index)
{
    func_800167FC(index, D_80087740);
    return D_80087740;
}
