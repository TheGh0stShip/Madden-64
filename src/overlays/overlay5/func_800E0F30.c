#include "types.h"

typedef struct {
    u8 pad0[0x1C];
    s32 unk_1C;
    s32 unk_20;
} Target;

typedef struct {
    u8 pad0[0xC];
    s32 unk_C;
    Target *unk_10;
    s16 unk_14;
    u8 unk_16;
    u8 unk_17;
} Obj;

extern s32 D_8007238C;
s16 func_800D3F4C(u8 a, s32 *b, s16 c, s32 d);
void func_800E0D30(Obj *obj);

s32 func_800E0F30(Obj *obj) {
    s16 done = 0;

    switch (obj->unk_16) {
    case 0:
        if (func_800D3F4C(obj->unk_17, &obj->unk_10->unk_1C, obj->unk_14, 0) == -1) {
            done = 1;
        }
        if (D_8007238C == 0) {
            obj->unk_10->unk_1C = obj->unk_14;
            done = 1;
        }
        break;
    case 1:
        if (func_800D3F4C(obj->unk_17, &obj->unk_10->unk_1C, obj->unk_14, 1) == -1) {
            done = 1;
        }
        if (D_8007238C == 0) {
            obj->unk_10->unk_1C = obj->unk_14;
            done = 1;
        }
        break;
    case 2:
        if (func_800D3F4C(obj->unk_17, &obj->unk_10->unk_20, obj->unk_14, 0) == -1) {
            done = 1;
        }
        if (D_8007238C == 0) {
            obj->unk_10->unk_20 = obj->unk_14;
            done = 1;
        }
        break;
    case 3:
        if (func_800D3F4C(obj->unk_17, &obj->unk_10->unk_20, obj->unk_14, 1) == -1) {
            done = 1;
        }
        if (D_8007238C == 0) {
            obj->unk_10->unk_20 = obj->unk_14;
            done = 1;
        }
        break;
    }
    if (done == 1) {
        if (obj->unk_C == 0) {
            func_800E0D30(obj);
            return 0;
        }
        return 1;
    }
    return 0;
}
