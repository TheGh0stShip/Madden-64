#include "types.h"

u8* func_8001B050(u8* command) {
    switch (command[0] & 0xE0) {
        case 0x00:
            return command + 7;
        case 0x20:
        case 0x40:
            return command + 4;
        default:
            return command + 1;
    }
}
