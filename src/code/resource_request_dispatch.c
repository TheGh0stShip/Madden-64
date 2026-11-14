#include "types.h"

extern u16 D_8007A45C[];
extern u16 func_8003515C(u32 type, u16 *table);
extern u16 func_80031A1C(u32 value);
extern void func_80034388(void *resource);
extern u32 resource_selection_update(void *resource, u32 value, u16 extra);

u16 resource_request_dispatch(void *resource, u32 type, u16 extra)
{
    s32 result = 3;
    u16 accepted;
    u32 value;

    accepted = func_8003515C((u8)type, D_8007A45C);
    if (accepted != 0) {
        value = D_8007A45C[func_80031A1C(accepted)];
        if ((value >> 8) == 0) {
            func_80034388(resource);
            result = 2;
        } else {
            result = resource_selection_update(resource, value, extra);
        }
    }
    return result;
}
