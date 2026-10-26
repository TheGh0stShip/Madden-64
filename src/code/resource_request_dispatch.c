#include "types.h"

extern u16 D_8007A45C[];
extern u16 func_8003515C(u32 type, u16 *table);
extern u16 func_80031A1C(u32 value);
extern void func_80034388(void *resource);
extern u32 func_80035064(void *resource, u16 value, u16 extra);

u16 resource_request_dispatch(void *resource, u32 type, u32 extra)
{
    register void *saved_resource __asm__("$17") = resource;
    register u32 result __asm__("$16") = 3;
    register u16 *table __asm__("$18") = D_8007A45C;
    register u32 saved_extra __asm__("$19") = extra;
    u32 index;
    u32 value;
    u32 accepted;
    __asm__("" : "=r"(saved_resource) : "0"(saved_resource));
    __asm__("" : "=r"(result) : "0"(result));

    accepted = func_8003515C((u8)type, table);
    accepted = (u16)accepted;
    if (accepted == 0) {
        return (u16)result;
    }

    index = func_80031A1C(accepted);
    value = table[(u16)index];
    if ((value >> 8) == 0) {
        func_80034388(saved_resource);
        result = 2;
    } else {
        result = func_80035064(saved_resource, value, (u16)saved_extra);
    }
    return (u16)result;
}
