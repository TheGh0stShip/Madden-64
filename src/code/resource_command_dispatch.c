#include "types.h"

extern void func_80019B10(void *context, u16 x, u16 y, u32 arg4, u32 arg5);
extern void func_80019DD0(void *context, u16 x, u16 y, u32 arg4, u32 arg5);
extern void func_80019FD4(void *context, u16 x, u16 y, u32 arg4, u32 arg5);
extern void func_8002E58C(void *destination, s32 value, u32 count);
extern void resource_bytes_copy(void *reader, void *destination, u32 count, u32 mode);

void resource_command_dispatch(void *context, u16 command, u16 x, u16 y,
                               u32 arg4, u32 arg5)
{
    switch (command) {
    case 7:
        func_80019B10(context, x, y, arg4, arg5);
        break;
    case 12:
        func_80019DD0(context, x, y, arg4, arg5);
        break;
    case 13:
        func_8002E58C((void *)arg5, 0, (u16)x * (u16)y);
        break;
    case 15:
        func_80019FD4(context, x, y, arg4, arg5);
        break;
    case 16:
        resource_bytes_copy(context, (void *)arg5, (u16)(x * y), 2);
        break;
    case 17:
    case 18:
        break;
    }
}
