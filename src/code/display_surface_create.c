#include "types.h"

extern void *D_80064BA0;
extern u16 D_8008B3D4;
extern u8 *func_80033298(void *pool);
extern void *func_80008DF8(s32 count);
extern void func_8000CBA8(void *surface);
extern void func_80033308(s32 first, void *destination, s32 size, s32 fourth);
extern void func_8000CCC8(void *surface);

void *display_surface_create(u32 identifier, u32 shift)
{
    u32 saved_identifier = identifier;
    u32 saved_shift = shift;
    u8 *surface;
    u32 count;

    surface = func_80033298(D_80064BA0);
    *(u16 *)(surface + 0x204) = saved_identifier;
    *(u16 *)(surface + 0x206) = 12;
    *(u32 *)(surface + 0x238) = 0;
    *(u16 *)(surface + 4) = D_8008B3D4;
    count = 1 << saved_shift;
    if (count > 0x100) {
        count = 0x100;
    }
    *(void **)(surface + 0x23C) = func_80008DF8(count);
    func_8000CBA8(surface);
    func_80033308(0, surface + 0x10, 0x1E0, 0);
    func_8000CCC8(surface);
    return surface;
}
