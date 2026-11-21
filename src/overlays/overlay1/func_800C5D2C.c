#include "types.h"

typedef struct {
    u8 unk_00[0x12];
    s16 unk_12;
} Unk800C1608Sub;

typedef struct {
    u8 unk_00[0x8];
    Unk800C1608Sub *unk_08;
    u8 unk_0C[0x48];
    u16 unk_54;
} Unk800C1608Obj;

typedef struct {
    u8 unk_00[0x24];
    Unk800C1608Obj *unk_24;
} Unk800C1608Arg;

typedef struct {
    s32 unk_00;
    s16 unk_04;
    s16 unk_06;
} Unk800C1608Buf;

extern s32 D_80088090;
void func_8000EC6C(Unk800C1608Obj *, Unk800C1608Buf *);
s32 func_8000C8EC(s32);

s32 func_800C5D2C(Unk800C1608Arg *arg0) {
    Unk800C1608Obj *obj = arg0->unk_24;
    Unk800C1608Buf buf;

    if (obj->unk_54 == 6) {
        return ((obj->unk_08->unk_12 + 0x100) >> 9) & 7;
    }
    if (obj->unk_54 == 7) {
        return ((obj->unk_08->unk_12 + 0x100) >> 9) & 7;
    }
    if (obj->unk_54 == 8) {
        func_8000EC6C(obj, &buf);
        if (func_8000C8EC(D_80088090)) {
            return ((buf.unk_04 + 0xD00) >> 9) & 7;
        }
        return ((buf.unk_04 + 0x500) >> 9) & 7;
    }
    return 0;
}
