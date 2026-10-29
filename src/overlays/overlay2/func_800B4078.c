#include "types.h"

typedef struct {
    u8 pad00[4];
    s32 handle;
} Track;

typedef struct {
    u8 kind;
    u8 pad01[3];
    u16 unk04;
    u16 unk06;
    Track *track;
    u16 base;
    u16 value;
} Gauge;

u16 func_8003A1D0(void);
s32 func_800D20A0(s32, u16, s32);
s32 func_80022B3C(s32, u16, s32);

void func_800B4078(Gauge *gauge) {
    u16 limit;

    switch (gauge->kind) {
        case 0:
            limit = func_8003A1D0();
            if (limit != 0 && gauge->unk06 < limit) {
                gauge->value = gauge->base + func_800D20A0(gauge->track->handle, gauge->unk06, 0x13);
            } else {
                gauge->value = gauge->base;
            }
            break;
        case 1:
            gauge->value = gauge->base - func_80022B3C(0, gauge->unk04, 0x13);
            break;
    }
}
