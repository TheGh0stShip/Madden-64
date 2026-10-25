#include "types.h"

extern s8 D_80087AF2;
extern void func_800AD404(void);
extern void func_800AD460(void);
extern void func_8002FF70(void *object);

void conditional_object_prepare(void *object)
{
    if (D_80087AF2 == 0) {
        func_800AD404();
        func_800AD460();
        func_8002FF70(object);
    }
}
