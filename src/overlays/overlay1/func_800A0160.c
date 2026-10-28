#include "types.h"

typedef struct {
    u8 unk00[0x24];
    u8 *obj;
    u8 unk28[4];
    s32 state;
    u8 unk30[0x80];
} Slot;

extern Slot D_80087138[];

void func_800C16A0(Slot *, s32);

void func_800A0160(void) {
    u32 i;

    for (i = 4; i < 8; i++) {
        if (D_80087138[i].state == 0x200) {
            func_800C16A0(&D_80087138[i], (*(s32 *)(D_80087138[i].obj + 0x1C) >= -0x1900000 ? 0xC00 : 0) | 0x400);
            *(s16 *)(*(u8 **)(D_80087138[i].obj + 8) + 0x60) = 0;
        }
    }
}
