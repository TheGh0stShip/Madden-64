#include "types.h"

typedef struct RuntimePosition {
    u8 pad0[0x1C];
    s32 x;
    s32 y;
    s32 state;
    u8 pad28[0xC];
    s32 timer;
} RuntimePosition;

typedef struct RuntimeObject {
    u8 pad0[0x24];
    RuntimePosition *position;
} RuntimeObject;

extern void func_8003CF78(s32, s32);
extern void func_800A365C(s32);
extern void func_800C61E8(RuntimeObject *);
extern void func_800C77F0(void);

extern s16 D_80084F6E;
extern RuntimePosition *D_80086178;
extern s16 D_800876F6;
extern RuntimeObject *D_8008A3DC;
extern u16 D_8008A5B2;

void func_800C9A80(void) {
    RuntimePosition *other;
    RuntimePosition *position = D_80086178;
    s32 delta;

    if (position->state == 0) {
        func_800C77F0();
        return;
    }

    if (((position->timer <= 0) || (D_8008A5B2 == 9)) &&
        (position->state < 0x200000)) {
        other = D_8008A3DC->position;
        delta = other->x - position->x;
        if ((delta > -0x180000) && (delta < 0x180000)) {
            delta = other->y - position->y;
            if ((delta > -0x180000) && (delta < 0x180000)) {
                if (D_8008A5B2 == 2) {
                    func_800A365C(4);
                }
                func_800C61E8(D_8008A3DC);
                func_8003CF78(0x19, 0xF);
                D_800876F6 = 0xA;
                D_8008A3DC = 0;
                D_80084F6E = 6;
            }
        }
    }
}
