#include "types.h"

typedef struct {
    u32 *entries;
    s32 count;
    s32 flags;
    s32 handle;
    u32 total;
    u8 pad14[4];
} Slot3586C;

u32 *func_80035EF0(u16, s32);
extern Slot3586C D_8008B078[];

u16 func_8003586C(u16 arg0, s32 arg1) {
    u16 i;

    for (i = 0; i < 0x10; i++) {
        if (D_8008B078[i].entries == 0) {
            break;
        }
    }
    D_8008B078[i].entries = func_80035EF0(arg0, arg1);
    ((u8 *)D_8008B078[arg0].flags)[arg1] |= 0x10;
    D_8008B078[i].count = -1;
    D_8008B078[i].flags = arg1;
    D_8008B078[i].handle = arg0;
    D_8008B078[i].total = *D_8008B078[i].entries / 12;
    return i | 0x8000;
}
