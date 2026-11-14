#include "types.h"

extern s32 D_800784A0;
extern s32 D_800654A0[][4];
extern s32 D_800654D0[][4];
extern u8 func_800A6580(void);

void *object_texture_descriptor_get(u8 *object)
{
    s32 mode;

    if (D_800784A0 == -1) {
        return 0;
    }
    switch (func_800A6580()) {
    case 3:
        mode = 1;
        break;
    case 7:
        mode = 2;
        break;
    default:
        mode = 0;
        break;
    }
    switch (*(u16 *)(object + 0x54)) {
    case 8:
        return &D_800654A0[mode][D_800784A0];
    case 12:
        return &D_800654D0[mode][D_800784A0];
    }
    return 0;
}
