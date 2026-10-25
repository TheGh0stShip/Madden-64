#include "types.h"

extern u8* D_8006AA58[];

s32 func_8003BEE4(u8 primary, u8 value) {
    register u8* accepted __asm__("$5");
    register u32 table_offset __asm__("$2");

    if ((u8)(value - 23) < 2) {
        return 1;
    }
    primary &= 0x3F;
    if (primary == (value & 0x3F)) {
        return 1;
    }
    table_offset = primary * 4;
    __asm__("lui $at,%%hi(D_8006AA58)\n\taddu $at,$at,%1\n\tlw %0,%%lo(D_8006AA58)($at)"
            : "=r"(accepted) : "r"(table_offset));
    while (*accepted != 0xFF) {
        if (value == *accepted) {
            return 1;
        }
        accepted++;
    }
    return 0;
}
