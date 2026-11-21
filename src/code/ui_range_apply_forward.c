#include "types.h"

void ui_slot_resource_bind_primary(void *context, u32 first, u32 second);

void ui_range_apply_forward(void *context, u32 first, u32 second, s32 count)
{
    if (first < second) {
        while (count--) {
            ui_slot_resource_bind_primary(context, first, second);
            first--;
            second--;
        }
    } else {
        while (count--) {
            ui_slot_resource_bind_primary(context, first, second);
            first++;
            second++;
        }
    }
}
