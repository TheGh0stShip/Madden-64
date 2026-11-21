#include "types.h"

typedef struct {
    u8 unk_00[0x10];
} Entry10;

typedef struct {
    u8 unk_00[0x18];
    s32 unk_18;
    s32 unk_1C;
    s32 unk_20;
} Obj;

void func_800B1A80(void);
void overlay5_runtime_object_construct(s32, Obj *, void *, Entry10 **);
extern u8 D_80087964[];
extern s32 D_80088474;
extern s32 D_80089490;
extern s32 D_80089494;
extern Entry10 D_800E6ED8[];
extern u8 D_800E6F68[];
extern u8 D_800E6F73;
extern u8 D_800E6F74;
extern Entry10 *D_800E6F7C;

void func_800CA320(Obj *obj) {
    Entry10 **cur;

    func_800B1A80();
    cur = &D_800E6F7C;
    D_80088474 = D_80087964[0];
    obj->unk_18 = 0x428;
    obj->unk_1C = 0;
    obj->unk_20 = 0x14A;
    *cur = &D_800E6ED8[D_80087964[0]];
    if (D_80089490 == -1 || D_80089494 == -1) {
        D_800E6F73 = 8;
        D_800E6F74 = 8;
    } else {
        D_800E6F73 = 7;
        D_800E6F74 = 7;
        if (*cur == &D_800E6ED8[7]) {
            *cur = &D_800E6ED8[1];
        }
    }
    overlay5_runtime_object_construct(0x420, obj, D_800E6F68, cur);
}
