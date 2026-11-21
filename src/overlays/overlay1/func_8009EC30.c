#include "types.h"

typedef struct {
    s16 x;
    s16 y;
    u8 unk_04[0xC];
} Vert;

typedef struct {
    u8 unk_00[0x14];
    u16 unk_14;
    u16 unk_16;
    u8 unk_18[0x4];
    s32 unk_1C;
    u8 unk_20[0xC];
    s16 unk_2C;
} Image;

typedef struct {
    u8 unk_00[0x4];
    Vert *unk_04;
    s32 unk_08;
} Out;

typedef struct {
    u8 unk_00[0x8];
    void *unk_08;
} Holder;

s32 func_8009A4C8(Image *, s32, s32);
extern Vert D_800656C0[8];

void func_8009A50C(Holder *arg0, Holder *arg1) {
    Image *img = arg0->unk_08;
    Out *out;
    s32 half;
    s32 i;
    s32 first;
    s32 last;
    s32 off;
    Vert *v;
    s32 n;
    s32 j;

    half = img->unk_16 >> 1;
    out = arg1->unk_08;
    for (i = 0; i < img->unk_14; i++) {
        if (func_8009A4C8(img, i, half)) {
            break;
        }
    }
    first = i;
    for (i = img->unk_14 - 1; i >= 0; i--) {
        if (func_8009A4C8(img, i, half)) {
            break;
        }
    }
    if (i < first) {
        return;
    }
    first = first * img->unk_1C / img->unk_14;
    last = i * img->unk_1C / img->unk_14;
    off = img->unk_2C;
    v = D_800656C0;
    D_800656C0[7].y = 0;
    D_800656C0[6].y = 0;
    D_800656C0[5].y = 0;
    D_800656C0[4].y = 0;
    D_800656C0[6].x = 0x780;
    D_800656C0[5].x = -0x780;
    D_800656C0[7].x = first += off;
    D_800656C0[4].x = last += off;
    n = 4;
    if (last >= -0x132) {
        n = 2;
        D_800656C0[2].y = -0x26;
        D_800656C0[3].y = 0x26;
        D_800656C0[3].x = -0x133;
        D_800656C0[2].x = -0x133;
    }
    if (first < 0x133) {
        n -= 2;
        D_800656C0[n].y = -0x26;
        j = n + 1;
        D_800656C0[j].y = 0x26;
        v[j].x = 0x133;
        D_800656C0[n].x = 0x133;
    }
    out->unk_04 = &v[n];
    out->unk_08 = 0x17E - n / 2;
}
