#include "types.h"

extern void func_8002B624(void *value);
extern void func_8002B870(void *value);
extern void func_8002BA18(void *value);
extern void func_8002BBB0(void *value);

void top_bits_dispatch(void *value)
{
    s32 type = *(u32 *)value >> 30;

    if (type == 1) {
        goto case1;
    }
    if (type < 2) {
        if (type == 0) {
            goto case0;
        }
        goto done;
    }
    if (type == 2) {
        goto case2;
    }
    if (type == 3) {
        goto case3;
    }
    goto done;
case0:
    func_8002B624(value);
    goto done;
case1:
    func_8002B870(value);
    goto done;
case2:
    func_8002BA18(value);
    goto done;
case3:
    func_8002BBB0(value);
done:
    return;
}
