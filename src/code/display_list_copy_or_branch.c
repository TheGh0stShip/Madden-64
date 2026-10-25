#include "types.h"

extern u8 D_80074A37;
extern u32 *D_80084F5C;

void display_list_copy_or_branch(u32 *start, u32 *end)
{
    register u32 *source __asm__("$6") = start;
    u32 second;

    if (D_80074A37 != 0) {
        end -= 2;
        while (source < end) {
            u32 *destination = D_80084F5C;

            destination[0] = source[0];
            second = source[1];
            source += 2;
            D_80084F5C = destination + 2;
            destination[1] = second;
        }
    } else {
        u32 *command = D_80084F5C;

        D_80084F5C = command + 2;
        command[0] = 0x06000000;
        command[1] = (u32)source;
    }
}
