#include "types.h"

typedef struct DisplaySurface {
    u8 bytes[0x204];
    u16 value204;
    u16 flags206;
    u8 tail[0x40];
} DisplaySurface __attribute__((aligned(4)));

extern void *D_80064BA0;
extern DisplaySurface *func_80033298(void *);
extern void func_8000CBA8(DisplaySurface *);
extern void func_8000C8F8(DisplaySurface *);

DisplaySurface *display_surface_clone(DisplaySurface *source, s32 value)
{
    DisplaySurface *result = func_80033298(D_80064BA0);

    *result = *source;
    result->value204 = value;
    result->flags206 |= 0x60;
    func_8000CBA8(result);
    if (source->flags206 & 0x10) {
        result->flags206 &= ~0x10;
        func_8000C8F8(result);
    }
    return result;
}
