#include "types.h"

extern void func_8002CA88(const char *format, ...);
extern u32 func_800430F4(void *stream, u16 position);
extern const char D_80002FA0[];
extern const char D_80002FDC[];

u32 stream_position_resolve(u8 *stream, u32 *result, u32 *secondary,
                            u32 position)
{
    register u32 count __asm__("$6");
    register u32 resolved_position __asm__("$5") = position;
    register u32 temporary __asm__("$2");

    count = **(u32 **)(*(u8 **)stream + 0x18);

    temporary = resolved_position < count;
    if (temporary == 0) {
        func_8002CA88(D_80002FA0);
        func_8002CA88(D_80002FDC,
                      *(u8 *)(*(u8 **)(stream + 0x18) + 6));
        temporary = **(u32 **)(*(u8 **)stream + 0x18);
        resolved_position = temporary - 1;
    }
    *result = func_800430F4(stream, (u16)resolved_position);
    *secondary = 0;
    return 0;
}
