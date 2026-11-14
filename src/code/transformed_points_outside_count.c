#include "types.h"

extern void func_80043488(s32 *output, void *first, void *second);
extern void func_800432E0(s32 *input, s32 *output, s32 count);

u16 transformed_points_outside_count(void *first, void *second, s16 *bounds,
                                     u16 unused)
{
    s32 points[8][4];
    s32 transformed[32];
    s32 value;
    s32 outside;
    s32 sum;
    u16 index;
    s32 coordinate;
    s32 less;
    s32 *point;

    func_80043488(transformed, first, second);
    func_800432E0(transformed, &points[0][0], 8);

    outside = 0;
    index = 0;
    do {
        coordinate = (index & 0xFFFF) * 16;
        point = (s32 *)(coordinate + (u32)points);
        coordinate = point[0];
        less = coordinate < bounds[0];
        coordinate = bounds[1] < coordinate;
        value = 1;
        if (coordinate != 0) goto horizontal_done;
        value = less;
horizontal_done:
        less = bounds[2];
        coordinate = point[1];
        coordinate = coordinate < less;
        value &= 0xFFFF;
        if (coordinate == 0) goto vertical_min_done;
        value |= 1;
vertical_min_done:
        coordinate = bounds[3];
        less = point[1];
        coordinate = coordinate < less;
        value &= 0xFFFF;
        if (coordinate == 0) goto vertical_max_done;
        value |= 1;
vertical_max_done:
        index++;
        sum = value + outside;
        outside = sum;
    } while (index < 8);

    return outside;
}
