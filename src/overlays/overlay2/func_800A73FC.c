#include "types.h"

typedef struct {
    u8 pad00[3];
    u8 unk3;
    s32 unk4;
    s32 objs[6];
} Data;

typedef struct {
    u8 pad00[0x60];
    Data *data;
} Screen;

typedef struct {
    s16 a;
    s16 b;
} PosPair;

extern PosPair D_800BDFD4[];
extern u8 D_800BDFEC[];

void func_80092B98(void);
void func_8003CE88(s32, s32, s32);
s16 func_800D3F4C(s16, s32, s16, u8);

void func_800A73FC(Screen *screen, u8 mode) {
    s32 objs[6];
    s16 pos[6];
    u8 flags[6];
    Data *data;
    u8 done = 0;
    u32 i;
    u32 count;
    s16 step;
    s16 time;

    data = screen->data;
    data->unk4 = 0;
    for (i = 0; i < 6; i++) {
        flags[i] = 1;
        if (D_800BDFEC[i] & 4) {
            objs[i] = data->objs[i] + 0x1C;
            pos[i] = D_800BDFD4[i].a;
        } else {
            objs[i] = data->objs[i] + 0x20;
            pos[i] = D_800BDFD4[i].b;
        }
        if (D_800BDFEC[i] & 1) {
            flags[i] = 0;
        }
        if (mode == 1) {
            pos[i] = 0;
        } else {
            flags[i] = (flags[i] + 1) & 1;
        }
    }
    count = 1;
    step = 0;
    time = 0;
    func_80092B98();
    func_80092B98();
    func_8003CE88(mode == 1 ? 0x3D : 0x3E, 0x69, 0x10);
    while (!done) {
        done = 1;
        for (i = 0; i < 6; i++) {
            if (i < 3 || data->unk3 != 1) {
                if (func_800D3F4C(time, objs[i], pos[i], flags[i]) == 0) {
                    done = 0;
                }
            }
        }
        func_80092B98();
        count++;
        time += step;
        if (count % 5 == 0) {
            step++;
        }
    }
}
