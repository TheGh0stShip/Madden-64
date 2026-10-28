#include "types.h"

typedef struct {
    u8 pad00[0x64];
    u8 kind;
    u8 pad65[0xB0 - 0x65];
} SlotObject;

extern SlotObject D_80087138[4];

void func_800A2BAC(s32);
u16 func_800C0BBC(SlotObject *, s32);
void func_800E1BCC(SlotObject *, s8 *);

void func_800A61A8(s32 arg0) {
    s8 event;
    u32 i;

    func_800A2BAC(0);
    for (i = 0; i < 4; i++) {
        if (D_80087138[i].kind == 0x34 && func_800C0BBC(&D_80087138[i], arg0) == 0) {
            event = 0x39;
            func_800E1BCC(&D_80087138[i], &event);
        }
    }
}
