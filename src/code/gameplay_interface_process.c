#include "types.h"

typedef struct {
    u32 unk_00_hi : 2;
    u32 a : 15;
    u32 d : 15;
    u32 f : 12;
    u32 c : 8;
    u32 b : 12;
    s32 e : 16;
    s32 g : 16;
} Interface;

typedef struct {
    u8 pad00[0x12];
    s16 a;
    s16 e;
    s16 b;
    s16 c;
    s16 d;
    s16 g;
    s16 f;
} InterfaceDelta;

void gameplay_interface_process(Interface *arg0, InterfaceDelta *delta) {
    Interface *iface = arg0;
    s32 v;
    s32 w;

    v = iface->a + delta->a;
    iface->a = v;
    if ((v & 0x7FFF) != v) {
        iface->a = 0x7FFF;
    }
    w = iface->e + delta->e;
    if ((iface->e += delta->e) != w) {
        iface->e = (w < 0) ? -0x8000 : 0x7FFF;
    }
    v = iface->b + delta->b;
    iface->b = v;
    if ((v & 0xFFF) != v) {
        iface->b = 0xFFF;
    }
    v = iface->c + delta->c;
    iface->c = v;
    if ((v & 0xFF) != v) {
        iface->c = 0xFF;
    }
    v = iface->d + delta->d;
    iface->d = v;
    if ((v & 0x7FFF) != v) {
        iface->d = 0x7FFF;
    }
    w = iface->g + delta->g;
    if ((iface->g += delta->g) != w) {
        iface->g = (w < 0) ? -0x8000 : 0x7FFF;
    }
    v = iface->f + delta->f;
    iface->f = v;
    if ((v & 0xFFF) != v) {
        iface->f = 0xFFF;
    }
}
