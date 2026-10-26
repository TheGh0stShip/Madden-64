#include "types.h"

extern s32 func_8001C670(void);
extern s32 func_8001CA44(void);

void layout_coordinates_build(s16 *coordinates, s32 x, s32 y, u32 flags)
{
    s32 value;

    if (flags & 0x10) {
        value = func_8001C670() + x;
        coordinates[0] = value;
        value = func_8001CA44() + y;
        coordinates[1] = value;
        value = func_8001C670() + x;
        coordinates[8] = value;
        value = func_8001CA44() + y;
        coordinates[9] = value;
        value = func_8001C670() + x;
        coordinates[24] = value;
        value = func_8001CA44() + y;
        coordinates[25] = value;
        value = func_8001C670() + x;
        coordinates[16] = value;
        value = func_8001CA44() + y;
    } else {
        value = func_8001C670() + x;
        coordinates[16] = value;
        coordinates[0] = value;
        value = func_8001CA44() + y;
        coordinates[9] = value;
        coordinates[1] = value;
        value = func_8001C670() + x;
        coordinates[24] = value;
        coordinates[8] = value;
        value = func_8001CA44() + y;
        coordinates[25] = value;
    }
    coordinates[17] = value;
}
