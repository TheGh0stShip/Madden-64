#include "types.h"

/* Free-camera controls: the analogue stick (centred at 0x10) turns the
 * heading (unk68) and tilts the pitch (unk64, kept within 0x400..0x800),
 * buttons 0x4000 / 0x8000 zoom the distance (unk98, kept within
 * 0x300000..0x3200000). */

typedef struct {
    u8 pad0[0x64];
    s16 pitch;
    u16 pad66;
    s16 heading;
    u8 pad6A[0x98 - 0x6A];
    s32 distance;
} FreeCamera;

extern u16 D_8008A5B4;
s32 func_80030B54(s16);
void func_80030EF4(s16, u8 *, u8 *);

void func_800E2BC0(FreeCamera *cam) {
    s8 x;
    s8 y;
    s32 buttons;

    buttons = func_80030B54(0);
    func_80030EF4(0, (u8 *)&x, (u8 *)&y);
    x -= 0x10;
    y -= 0x10;
    if (x != 0) {
        x = D_8008A5B4 * x;
        cam->heading = (cam->heading + x) & 0xFFF;
    }
    if (y != 0) {
        y = D_8008A5B4 * y;
        cam->pitch = (cam->pitch - y) & 0xFFF;
        cam->pitch = (cam->pitch < 0x400) ? 0x400 : cam->pitch;
        cam->pitch = (cam->pitch > 0x800) ? 0x800 : cam->pitch;
    }
    if (buttons & 0x4000) {
        cam->distance -= 0x200000;
    } else if (buttons & 0x8000) {
        cam->distance += 0x200000;
    }
    cam->distance = (cam->distance >= 0x300000) ? cam->distance : 0x300000;
    cam->distance = (cam->distance <= 0x3200000) ? cam->distance : 0x3200000;
}
