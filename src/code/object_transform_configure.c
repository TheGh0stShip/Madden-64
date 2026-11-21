#include "types.h"

typedef struct {
    s16 ob[3];
    u16 flag;
    s16 tc[2];
    u8 cn[4];
} Vtx;

typedef struct {
    u8 pad0[0xA];
    u16 unk_0A;
    u16 unk_0C;
    u8 pad0E[0x1F8 - 0xE];
    u16 unk_1F8;
    u16 unk_1FA;
    u16 unk_1FC;
    u16 unk_1FE;
    u8 pad200[6];
    u16 unk_206;
    u8 pad208[0x38];
    u8 unk_240;
    u8 unk_241;
    s8 unk_242;
} Object;

extern void func_80033308(s32, void *, u32, u8);
extern Vtx D_80087FF0[2][4];

void object_transform_configure(Object *obj, u8 mode, s8 flag) {
    u32 i;

    func_80033308(0, D_80087FF0, 0x80, 0);
    obj->unk_240 = mode;
    obj->unk_206 |= 0x400;
    switch (mode) {
    case 0:
    case 1:
        for (i = 0; i < 2; i++) {
            D_80087FF0[i][0].ob[0] = obj->unk_1F8 - (obj->unk_1FC >> 1);
            D_80087FF0[i][0].ob[1] = obj->unk_1FA - (obj->unk_1FE >> 1);
            D_80087FF0[i][1].ob[0] = obj->unk_0A - 1 - (obj->unk_1FC >> 1);
            D_80087FF0[i][1].ob[1] = obj->unk_1FA - (obj->unk_1FE >> 1);
            D_80087FF0[i][2].ob[0] = obj->unk_1F8 - (obj->unk_1FC >> 1);
            D_80087FF0[i][2].ob[1] = obj->unk_0C - 1 - (obj->unk_1FE >> 1);
            D_80087FF0[i][3].ob[0] = obj->unk_0A - 1 - (obj->unk_1FC >> 1);
            D_80087FF0[i][3].ob[1] = obj->unk_0C - 1 - (obj->unk_1FE >> 1);
        }
        obj->unk_242 = flag;
        if (flag < 0) {
            obj->unk_241 = 0xFF;
        } else {
            obj->unk_241 = 0;
        }
        break;
    }
}
