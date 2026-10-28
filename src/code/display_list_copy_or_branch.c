#include "types.h"

extern u8 D_80074A37;
extern u32 *D_80084F5C;

void display_list_copy_or_branch(u32 *start, u32 *end)
{
    u32 second;

    if (D_80074A37 != 0) {
        end -= 2;
        while (start < end) {
            u32 *destination = D_80084F5C;

            destination[0] = start[0];
            second = start[1];
            start += 2;
            D_80084F5C = destination + 2;
            destination[1] = second;
        }
    } else {
        u32 *command = D_80084F5C;

        D_80084F5C = command + 2;
        command[0] = 0x06000000;
        command[1] = (u32)start;
    }
}
