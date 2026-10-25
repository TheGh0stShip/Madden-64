#include "types.h"

extern void func_800B8EB0(void *object, u16 value);
extern void func_800B8DD8(void *object, u16 value);
extern u16 func_800B8CE4(void *object, u16 value);

u16 three_stage_value_update(void *object, u16 value)
{
    func_800B8EB0(object, value);
    func_800B8DD8(object, value);
    return func_800B8CE4(object, value);
}
