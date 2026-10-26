#include "types.h"

u16 func_8003DC54(u32 value)
{
    register u32 original __asm__("$7") = value;
    register u32 work __asm__("$6") = original;
    register u8 *low_base __asm__("$4");
    register u32 normalized __asm__("$3");
    register u32 temp __asm__("$2");
    u16 high[11] = {
        0x75, 0x14, 0x0E, 0x7B, 0x57, 0x49,
        0x7C, 0x19, 0x67, 0x1C, 0x06
    };
    u8 low[30] = {
        0x16, 0x00, 0x01, 0x02, 0x03, 0x04, 0x05, 0x06,
        0x07, 0x08, 0x0A, 0x10, 0x0B, 0x0C, 0x0D, 0x0E,
        0x0F, 0x09, 0x11, 0x12, 0x13, 0x14, 0x15, 0x17,
        0x18, 0x19, 0x1A, 0x1B, 0x1C, 0x1D
    };

    __asm__("" : "=r"(original) : "0"(original));
    __asm__("" : "=r"(work) : "0"(work));
    low_base = low;

    if ((u16)work >= 0x52) {
        work = original - 0x52;
    }
    if ((u16)work >= 0x29) {
        work -= 0x29;
    }
    normalized = work & 0xFFFF;
    __asm__("" : "=r"(normalized) : "0"(normalized));
    temp = normalized < 0x1E;
    __asm__("" : "=r"(temp) : "0"(temp));
    if (temp) {
        temp = (u32)(low_base + normalized);
        __asm__("" : "=r"(temp) : "0"(temp));
        temp = *(u8 *)temp;
        __asm__("" : "=r"(temp) : "0"(temp));
        return temp & 0xFFFF;
    }
    temp = normalized << 1;
    __asm__("" : "=r"(temp) : "0"(temp));
    temp = temp + (u32)(u8 *)high - 0x3C;
    temp = *(u16 *)temp;
    __asm__("" : "=r"(temp) : "0"(temp));
    return temp & 0xFFFF;
}
