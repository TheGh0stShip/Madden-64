#include "types.h"

extern u8 *D_80078460[8];
extern void *func_80035D7C(u16 resource_id);

void resource_pointer_table_initialize(u16 resource_id)
{
    u32 index;
    u8 **entry;
    u8 *resource;
    u8 *result;

    result = func_80035D7C(resource_id);
    index = 0;
    entry = D_80078460;
    resource = result;
    do {
        *entry++ = resource;
        index++;
        resource += 0x200;
    } while (index < 8);
}
