#include "types.h"

typedef struct {
    s32 unk_00;
    u8 unk_04[0x20];
    s32 unk_24;
    u8 unk_28[0x20];
    s32 unk_48;
    u8 unk_4C[0x20];
    s32 unk_6C;
} InterfaceRuntime;

extern s32 D_80087920;

void interface_runtime_process(s16 *script, s32 *pc, InterfaceRuntime *rt) {
    s16 op;
    s32 value;
    s32 delta;

    if (rt->unk_48 != 0) {
        rt->unk_48--;
        rt->unk_00 += rt->unk_24;
        return;
    }
    op = script[*pc];
    switch (op & 0xF000) {
        case 0x0000:
            value = op & 0xFFF;
            value <<= 12;
            rt->unk_24 = value;
            rt->unk_00 += value;
            break;
        case 0x7000:
            value = op & 0xFFF;
            D_80087920 = value;
        negative:
            value <<= 12;
            delta = -value;
            rt->unk_24 = delta;
            rt->unk_00 += delta;
            break;
        case 0x9000:
            (*pc)++;
            value = op & 0xFFF;
            value += script[*pc] << 12;
            goto negative;
        case 0x8000:
            (*pc)++;
            value = op & 0xFFF;
            value += script[*pc] << 12;
            value <<= 12;
            rt->unk_24 = value;
            rt->unk_00 += value;
            break;
        case 0x1000:
            delta = rt->unk_00;
            value = rt->unk_24;
            rt->unk_48 = op & 0xFFF;
            delta += value;
            rt->unk_00 = delta;
            break;
        case 0x2000:
            rt->unk_00 = rt->unk_6C;
            *pc = 0;
            interface_runtime_process(script, pc, rt);
            return;
        case 0x3000:
        case 0x5000:
        case 0x6000:
            break;
        case 0x4000:
        default:
            return;
    }
    (*pc)++;
}
