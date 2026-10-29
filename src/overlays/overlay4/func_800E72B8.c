#include "types.h"

typedef struct {
    u16 *id;
    s32 arg;
    s32 sound;
} ScreenParams;

extern s32 D_80088090;
extern s32 D_8008B3D0;
extern s16 D_80087A68;
extern void func_800448C4(void);
extern void func_8000C8AC(s32 arg0);
extern void func_8000BEE8(s32 arg0);
extern void func_8000C930(s32 *fade, s32 r, s32 g, s32 b);
extern void func_800457F8(s32 sound);
extern u8 func_800B7680(u16 id, s32 arg);
extern void func_800458F8(void);
extern void func_8000C8BC(s32 arg0);

s32 func_800E72B8(s32 arg0, ScreenParams *params) {
    u16 *id;
    u8 result;

    id = params->id;
    func_800448C4();
    func_8000C8AC(D_80088090);
    func_8000BEE8(2);
    func_8000C930(&D_8008B3D0, 0, 0, 0);
    switch (D_80087A68) {
    case 1:
        func_8000C930(&D_8008B3D0, 0x20, 0x20, 0x20);
        break;
    case 3:
        func_8000C930(&D_8008B3D0, 0xFF, 0xFF, 0xFF);
        break;
    case 4:
        func_8000C930(&D_8008B3D0, 8, 8, 8);
        break;
    default:
    case 2:
        func_8000C930(&D_8008B3D0, 0x68, 0x80, 0xD8);
        break;
    }
    if (params->sound != 0) {
        func_800457F8(params->sound);
    }
    result = func_800B7680(*id, params->arg);
    if (params->sound != 0) {
        func_800458F8();
    }
    func_8000C8BC(D_80088090);
    return result ? -1 : 1;
}
