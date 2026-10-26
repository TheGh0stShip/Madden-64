#include "types.h"

extern u16 func_80028224(void);
extern u16 func_8003A50C(void);
extern u32 func_8003A584(u32 index);

u32 frame_index_resolve(u32 index)
{
    register u32 result __asm__("$3") = index;

    if ((index & 0x8000) == 0) {
        result = index + 1;
        if ((u16)result < 0x17CD) {
            goto done;
        }
        if (func_80028224() != 1) {
            result = 0xFFFF;
            goto done;
        }
        if (func_8003A50C() == 0) {
            result = 0xFFFF;
            goto done;
        }
        result = func_8003A584(0);
        goto done;
    } else {
        result = func_8003A584((u16)result);
        if ((u16)result == 0) {
            result = 0xFFFF;
        }
    }
done:
    return (u16)result;
}
