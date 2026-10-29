#include "types.h"

extern s16 func_800241A0(u16 context, u8 value);
extern s16 func_80024504(u16 context, u8 first, u8 second);
extern s32 func_800245B8(u16 context, u8 first, u8 second);

s32 func_800D3B48(u8* command, s32 context) {
    s32 saved_context = context;
    s8 type = command[0];
    s32 result = 0;

    switch (type) {
        case 0:
        case 3:
            result = func_800241A0(saved_context, command[1]);
            break;
        case 1:
        case 6:
            result = func_80024504(saved_context, command[1], command[2]);
            break;
        case 2:
            result = func_800245B8(saved_context, command[1], command[2]);
            break;
        case 4:
            result = command[1];
            break;
        case 5:
        default:
            break;
    }
    return result;
}
