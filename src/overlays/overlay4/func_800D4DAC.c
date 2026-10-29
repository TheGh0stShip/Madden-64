#include "types.h"

typedef struct Sub { u8 pad[0x20]; s32 x20; } Sub;
typedef struct Obj { u8 pad0[0x24]; Sub *sub; u16 flags; u8 pad1[0x65 - 0x2A]; u8 x65; u8 pad2[0x90 - 0x66]; s32 x90; } Obj;
typedef struct Pos { u8 pad[0x1C]; s32 x; s32 z; } Pos;
typedef struct Msg { s8 a; u8 b; } Msg;

s32 func_8009CA5C(s32, s32);
s32 func_800C0018(Obj *, s32, s32);
s32 func_800C5F80(void);
s32 func_800E1A84(Obj *, Msg *);
extern Pos *D_80086178;
typedef struct Event { s8 type; s8 pad; s16 x; s16 z; u8 pad2[6]; Obj *obj; } Event;
extern Event D_80087AB0;

s32 func_800D4DAC(Obj *arg0) {
    Msg m;
    Event *ev;

    switch (arg0->x65) {
    case 1:
        ev = &D_80087AB0;
        ev->type = 0x21;
        ev->x = D_80086178->x >> 16;
        ev->z = D_80086178->z >> 16;
        ev->obj = arg0;
        func_800C5F80();
        func_8009CA5C(0x2D, 0xD2);
        return 1;
    case 2:
        m.a = 0xE;
        m.b = 0xFE;
        func_800E1A84(arg0, &m);
        arg0->flags |= 0x10;
        return 1;
    case 3:
        if (arg0->x90 >= arg0->sub->x20) {
            return 1;
        }
        func_800C0018(arg0, 0x800, 0);
        return 0;
    }
    return 0;
}
