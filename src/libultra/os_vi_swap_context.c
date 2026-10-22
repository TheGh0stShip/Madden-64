#include "os_internal.h"

void __osViSwapContext(void) {
    register OSViMode* mode;
    register OSViContext* context;
    u32 origin;
    u32 hStart;
    u32 scale;
    u32 field;

    field = 0;
    context = D_80074EA4;
    mode = context->modep;
    field = *(volatile u32*)0xA4400010 & 1;
    origin = osVirtualToPhysical(context->framep) + mode->fldRegs[field].origin;
    if (context->state & 2) {
        context->x.scale |= mode->xScale & ~0xFFF;
    } else {
        context->x.scale = mode->xScale;
    }
    if (context->state & 4) {
        scale = mode->fldRegs[field].yScale & 0xFFF;
        context->y.scale = context->y.factor * scale;
        context->y.scale |= mode->fldRegs[field].yScale & ~0xFFF;
    } else {
        context->y.scale = mode->fldRegs[field].yScale;
    }
    hStart = mode->hStart;
    if (context->state & 0x20) {
        hStart = 0;
    }
    if (context->state & 0x40) {
        context->y.scale = 0;
        origin = osVirtualToPhysical(context->framep);
    }
    if (context->state & 0x80) {
        context->y.scale = (context->y.offset << 16) & 0x03FF0000;
        origin = osVirtualToPhysical(context->framep);
    }
    *(volatile u32*)0xA4400004 = origin;
    *(volatile u32*)0xA4400008 = mode->width;
    *(volatile u32*)0xA4400014 = mode->burst;
    *(volatile u32*)0xA4400018 = mode->vSync;
    *(volatile u32*)0xA440001C = mode->hSync;
    *(volatile u32*)0xA4400020 = mode->leap;
    *(volatile u32*)0xA4400024 = hStart;
    *(volatile u32*)0xA4400028 = mode->fldRegs[field].vStart;
    *(volatile u32*)0xA440002C = mode->fldRegs[field].vBurst;
    *(volatile u32*)0xA440000C = mode->fldRegs[field].vIntr;
    *(volatile u32*)0xA4400030 = context->x.scale;
    *(volatile u32*)0xA4400034 = context->y.scale;
    *(volatile u32*)0xA4400000 = context->control;
    D_80074EA4 = D_80074EA0;
    D_80074EA0 = context;
    *D_80074EA4 = *D_80074EA0;
}
