#include "types.h"

typedef struct ViMode {
    u8 pad00[0x1C];
    u32 unk_1C;
    u32 unk_20;
    u8 pad24[8];
    u32 unk_2C;
    u32 unk_30;
    u8 pad34[0xC];
    u32 unk_40;
    u32 unk_44;
} ViMode;

extern s32 D_80072328;
extern s32 D_8007232C;
extern s32 D_80072330;
extern s32 D_80072334;
extern u32 D_800884B8;
extern u32 D_800884CC;
extern u32 D_800884D0;
extern u32 D_800884DC;
extern u32 D_800884E0;
extern ViMode *D_8008B37C;

void math_tables_initialize(s32 arg0, s32 arg1, s32 arg2, s32 arg3) {
    u32 hStart;
    u32 hEnd;
    u32 vStart;
    u32 vEnd;
    u32 reg;
    f32 xScale;
    f32 yScale;
    f32 hRange;
    f32 vRange;
    f32 width;
    f32 height;

    D_8007232C = arg0;
    D_80072334 = arg1;
    D_80072328 = arg2;
    D_80072330 = arg3;

    xScale = D_800884D0;
    hStart = D_800884CC;
    reg = hStart;
    hStart >>= 16;
    hEnd = reg & 0xFFFF;
    hRange = hEnd - hStart;
    width = D_800884B8;
    xScale = xScale * hRange / width;

    yScale = D_800884DC;
    vStart = D_800884E0;
    reg = vStart;
    vStart >>= 16;
    vEnd = reg & 0xFFFF;
    vRange = vEnd - vStart;
    height = 240.0f;
    yScale = yScale * vRange / height;

    hStart = (f32)hStart - arg2 * hRange / (width * 2);
    hRange += arg2 * hRange / width;
    hStart += arg0;
    D_8008B37C->unk_20 = width * xScale / hRange;
    if (hStart < 0x60) {
        hStart = 0x60;
    }
    hEnd = hStart + (u32)hRange;
    hEnd &= 0xFFFF;
    hStart <<= 16;
    if (hEnd > 0x300) {
        hEnd = 0x300;
    }
    hStart |= hEnd;
    D_8008B37C->unk_1C = hStart;

    vStart = (f32)vStart - arg3 * vRange / (height * 2);
    vRange += arg3 * vRange / height;
    vStart += arg1;
    D_8008B37C->unk_2C = D_8008B37C->unk_40 = height * yScale / vRange;
    if (vStart < 8) {
        vStart = 8;
    }
    if (vEnd < vStart) {
        vStart = 8;
    }
    vEnd = vStart + (u32)vRange;
    vEnd &= 0xFFFF;
    vStart <<= 16;
    if (vEnd > 0x204) {
        vEnd = 0x204;
    }
    vStart |= vEnd;
    D_8008B37C->unk_30 = D_8008B37C->unk_44 = vStart;
}
