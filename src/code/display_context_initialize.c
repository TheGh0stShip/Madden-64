#include "types.h"

extern u16 D_8008AFD4;
extern void *D_80074A80;
extern void *D_80074A78;
extern void *D_80074A7C;
extern s32 D_8007AB10[];
extern s32 D_8007AB1C[];
extern s32 D_8007AB18;
extern s32 D_8007AB24;
extern s32 D_8007AB04;
extern s32 D_8007AB08;
extern s32 func_8002E7A0(void *context, void *resource);

void display_context_initialize(void)
{
    void **context = &D_80074A80;
    u32 index = D_8008AFD4;
    void *context_value = *context;
    void *resource = D_80074A78;
    s32 result;

    D_8007AB18 = D_8007AB10[index];
    D_8007AB24 = D_8007AB1C[index];
    result = func_8002E7A0(context_value, resource);
    context_value = *context;
    resource = D_80074A7C;
    D_8007AB04 = result;
    D_8007AB08 = func_8002E7A0(context_value, resource);
}
