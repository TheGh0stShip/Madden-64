#include "types.h"

typedef struct {
    /* 0x00 */ u16 type;
    /* 0x02 */ u16 width;
    /* 0x04 */ u16 height;
    /* 0x06 */ u16 unk_06;
    /* 0x08 */ u16 unk_08;
    /* 0x0A */ u8 pad0A[4];
    /* 0x0E */ u16 flags;
    /* 0x10 */ s32 unk_10;
    /* 0x14 */ u16 unk_14;
    /* 0x16 */ u16 unk_16;
} Setup;

typedef struct {
    /* 0x00 */ u16 offset;
    /* 0x02 */ u16 unk_02;
    /* 0x04 */ u16 unk_04;
} ResHeader;

typedef struct {
    /* 0x00 */ s32 size;
    /* 0x04 */ u16 width;
    /* 0x06 */ u16 height;
    /* 0x08 */ u8 data[1];
} ResImage;

typedef struct {
    /* 0x00 */ u16 size;
    /* 0x02 */ u16 unk_02;
    /* 0x04 */ u16 unk_04;
    /* 0x06 */ u8 data[1];
} ResPalette;

typedef struct {
    /* 0x00 */ u32 type;
    /* 0x04 */ u8 *unk_04;
    /* 0x08 */ u8 *unk_08;
    /* 0x0C */ void *unk_0C;
    /* 0x10 */ void *unk_10;
    /* 0x14 */ u16 unk_14;
    /* 0x16 */ u16 unk_16;
    /* 0x18 */ u8 pad18[4];
    /* 0x1C */ s32 unk_1C;
    /* 0x20 */ s32 unk_20;
    /* 0x24 */ s32 unk_24;
    /* 0x28 */ s32 unk_28;
    /* 0x2C */ u16 unk_2C;
    /* 0x2E */ u16 unk_2E;
    /* 0x30 */ u8 pad30[4];
    /* 0x34 */ s16 unk_34;
    /* 0x36 */ s16 unk_36;
    /* 0x38 */ u16 unk_38;
    /* 0x3A */ u16 flags;
    /* 0x3C */ u16 unk_3C;
    /* 0x3E */ u16 unk_3E;
    /* 0x40 */ u16 unk_40;
    /* 0x42 */ u16 unk_42;
    /* 0x44 */ u8 pad44[4];
} Sprite;

typedef struct {
    /* 0x00 */ u8 pad00[8];
    /* 0x08 */ Sprite *sprite;
    /* 0x0C */ u8 pad0C[8];
    /* 0x14 */ s32 unk_14;
    /* 0x18 */ s32 unk_18;
    /* 0x1C */ s32 unk_1C;
    /* 0x20 */ s32 unk_20;
    /* 0x24 */ s32 unk_24;
} Owner;

void func_8002E17C(void *destination, const void *source, u32 size);
void *func_80032E00(s32, s32);
void func_80033308(s32 first, void *resource, s32 size, s32 fourth);
s32 func_80035598(u16 value, u16 type);
void *func_80035D7C(u16, u16);
void func_80035F88(u16, u16);
void func_80036268(u16, u16, void *);
void func_80098178(Sprite *);
void func_8009A440(s32, Sprite *);
extern u8 D_800656E0[];

void func_8009D57C(Owner *owner, Setup *arg1) {
    Sprite *sprite;
    Setup *setup;
    ResHeader *res;
    ResImage *image;
    ResPalette *palette;
    u8 *data;
    u32 size;
    u16 n;

    setup = arg1;
    sprite = owner->sprite;
    func_80033308(0, sprite, 0x48, 0);
    sprite->type = arg1->type;
    switch (sprite->type) {
    case 0:
        sprite->flags = arg1->flags;
        sprite->unk_1C = arg1->width;
        sprite->unk_20 = arg1->height;
        res = func_80035D7C(arg1->unk_06, arg1->unk_08);
        image = (ResImage *)((u8 *)res + res->offset);
        palette = (ResPalette *)((u8 *)image + image->size);
        sprite->unk_24 = res->unk_02;
        sprite->unk_28 = res->unk_04;
        sprite->unk_14 = image->width;
        sprite->unk_16 = image->height;
        sprite->unk_34 = 1;
        sprite->unk_2C = -(sprite->unk_1C >> 1);
        sprite->unk_2E = -(sprite->unk_20 >> 1);
        sprite->unk_38 = palette->unk_04;
        data = image->data;
        size = image->size - 8;
        sprite->unk_0C = func_80032E00(0, size);
        func_8002E17C(sprite->unk_0C, data, size);
        size = palette->size - 6;
        if (size != 0) {
            sprite->unk_10 = func_80032E00(0, size);
            data = palette->data;
            func_8002E17C(sprite->unk_10, data, size);
        }
        func_80035F88(arg1->unk_06, arg1->unk_08);
        if (sprite->flags & 0x8000) {
            sprite->unk_2E = -sprite->unk_2E;
            sprite->unk_20 = -sprite->unk_20;
        }
        if (sprite->flags & 0x4000) {
            sprite->unk_2C = -sprite->unk_2C;
            sprite->unk_1C = -sprite->unk_1C;
        }
        func_80098178(sprite);
        break;
    case 3:
        sprite->flags = arg1->flags;
        if (sprite->flags & 0x2000) {
            func_8009A440(arg1->unk_10, sprite);
        } else {
            sprite->unk_1C = arg1->width;
            sprite->unk_20 = arg1->height;
            res = func_80035D7C(arg1->unk_06, arg1->unk_08);
            image = (ResImage *)((u8 *)res + res->offset);
            palette = (ResPalette *)((u8 *)image + image->size);
            sprite->unk_24 = res->unk_02;
            sprite->unk_28 = res->unk_04;
            sprite->unk_14 = image->width;
            sprite->unk_16 = image->height;
            sprite->unk_34 = 1;
            sprite->unk_2C = -(sprite->unk_1C >> 1);
            sprite->unk_2E = -(sprite->unk_20 >> 1);
            sprite->unk_38 = palette->unk_04;
            data = image->data;
            size = image->size - 8;
            sprite->unk_0C = func_80032E00(0, size);
            func_8002E17C(sprite->unk_0C, data, size);
            size = palette->size - 6;
            if (size != 0) {
                sprite->unk_10 = func_80032E00(0, size);
                data = palette->data;
            func_8002E17C(sprite->unk_10, data, size);
            }
            func_80035F88(arg1->unk_06, arg1->unk_08);
        }
        sprite->unk_36 = 4;
        size = 0x40;
        if (sprite->type == 3) {
            sprite->unk_40 = setup->unk_14;
            sprite->unk_42 = setup->unk_16;
            size = 0x80;
            if (sprite->flags & 0x1000) {
                for (n = sprite->unk_14 >> 1; n != 0; n >>= 1) {
                    sprite->unk_3C++;
                }
            }
            if (sprite->flags & 0x800) {
                for (n = sprite->unk_16 >> 1; n != 0; n >>= 1) {
                    sprite->unk_3E++;
                }
            }
        }
        sprite->unk_04 = func_80032E00(0, size);
        func_80033308(0, sprite->unk_04, size, 0);
        size >>= 1;
        sprite->unk_08 = sprite->unk_04 + size;
        if (sprite->flags & 0x8000) {
            sprite->unk_2E = -sprite->unk_2E;
            sprite->unk_20 = -sprite->unk_20;
        }
        if (sprite->flags & 0x4000) {
            sprite->unk_2C = -sprite->unk_2C;
            sprite->unk_1C = -sprite->unk_1C;
        }
        func_80098178(sprite);
        break;
    case 1:
        sprite->unk_0C = func_80032E00(0, func_80035598(setup->unk_06, setup->unk_08));
        sprite->unk_08 = (u8 *)0x17D;
        sprite->unk_04 = D_800656E0;
        func_80036268(setup->unk_06, setup->unk_08, sprite->unk_0C);
        break;
    case 2:
        break;
    }
    owner->unk_14 = 1;
    owner->unk_18 = 0;
    owner->unk_1C = owner->unk_20 = owner->unk_24 = 0;
}
