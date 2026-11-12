#include "types.h"

typedef struct {
    u8 pad00[0x6C];
    s32 slots[4];
} Panel;

typedef struct {
    u8 pad00[8];
    s32 unk08;
    u8 pad0C[0x68];
    Panel panel;
} Screen;

extern u16 D_800892B4[];

void func_800A3A74(u16);
void func_800A3ABC(u16, s32);
u8 func_8003C1F0(u8);
void func_8001F25C(s32, s16, s32);
s32 func_8001F848(u8, u16, u8);
void func_8001EC20(s32, s32);

void func_800A3D84(Screen *screen, u16 slot, s32 color) {
    u16 *pair;
    Panel *panel;

    func_800A3A74(slot);
    func_800A3ABC(slot, color);
    pair = &D_800892B4[1];
    if (func_8003C1F0(*pair) != 0) {
        func_8001F25C(0, D_800892B4[0], 0);
        func_8001F25C(1, *(s16 *)pair, 1);
    } else {
        func_8001F25C(0, D_800892B4[0], 1);
        func_8001F25C(1, *(s16 *)pair, 0);
    }
    panel = (Panel *)((u8 *)screen - -0x74);
    panel->slots[slot] = func_8001F848(slot, D_800892B4[slot], slot);
    func_8001EC20(screen->unk08, slot + 0x1B);
}
