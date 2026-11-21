#include "types.h"

typedef void (*AllFunc)(s32 base, u32 index, void *data, void *user);
typedef void (*OneFunc)(u16 id, void *data, void *user);
typedef void (*DoneFunc)(void *arg, u8 base, void *user);

typedef struct {
    /* 0x00 */ s32 unk_00;
    /* 0x04 */ DoneFunc done;
    /* 0x08 */ s16 unk_08;
    /* 0x0A */ u16 unk_0A;
    /* 0x0C */ u8 unk_0C;
    /* 0x0D */ u8 unk_0D;
    /* 0x0E */ u8 pad_0E[0x1A - 0xE];
    /* 0x1A */ u16 unk_1A;
    /* 0x1C */ u8 count;
    /* 0x1D */ u8 unk_1D;
    /* 0x1E */ u8 unk_1E;
    /* 0x1F */ u8 pad_1F[1];
    /* 0x20 */ void **funcs;
    /* 0x24 */ u8 *unk_24;
    /* 0x28 */ u8 *unk_28;
    /* 0x2C */ u8 pad_2C[2];
    /* 0x2E */ u8 flags;
    /* 0x2F */ u8 pad_2F[0xD];
    /* 0x3C */ void **unk_3C;
    /* 0x40 */ u32 *unk_40;
    /* 0x44 */ s32 unk_44;
    /* 0x48 */ void *unk_48;
    /* 0x4C */ void *user;
} Dispatch;

extern u32 D_8007A418;
void func_8001EC20(s32 a, s32 b);

void func_800DB2A4(Dispatch *d) {
    void **funcs;
    AllFunc all;
    OneFunc one;
    s32 base;
    s32 k;
    u32 i;

    base = d->unk_0A + d->unk_0D;
    funcs = d->funcs;
    all = funcs[0];
    for (i = 0; i < d->count; i++) {
        D_8007A418 = i;
        if (i >= d->unk_1E) {
            D_8007A418 = i + d->unk_1A;
        }
        one = funcs[D_8007A418];
        k = d->unk_28[i] + d->unk_0D;
        if (d->unk_24[i] != 0) {
            if (d->flags & 0x40) {
                all(base, D_8007A418, d->unk_3C[k], d->user);
            } else {
                one(base, d->unk_3C[k], d->user);
            }
            func_8001EC20(d->unk_44, k);
        } else if (d->flags & 0x40) {
            all(base, D_8007A418, &d->unk_40[k], d->user);
        } else {
            one(base, &d->unk_40[k], d->user);
        }
    }
    if (d->done != 0) {
        d->done(d->unk_48, d->unk_0D, d->user);
    }
}
