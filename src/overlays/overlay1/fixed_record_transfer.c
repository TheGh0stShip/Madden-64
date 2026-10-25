#include "types.h"

extern u8 D_80097224[];
extern void func_80008F30(void *destination, const void *source,
                         const void *context, s32 size);

void fixed_record_transfer(void *context, void *destination)
{
    func_80008F30(destination, D_80097224, context, 0x32);
}
