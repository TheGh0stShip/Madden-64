#include "types.h"

typedef struct {
    s32 unk_00[8];
} IdList;

typedef struct {
    s16 unk_00;
    s16 unk_02;
    void *unk_04;
    s32 unk_08;
    s32 unk_0C;
    s16 unk_10;
    s16 unk_12;
    s32 unk_14;
} SpriteDesc;

typedef struct {
    s32 unk_00;
    s16 unk_04;
    s16 unk_06;
    s16 unk_08;
    s16 unk_0A;
    s32 unk_0C;
    s32 unk_10;
    u8 unk_14[0x14];
} ImageDesc;

typedef struct {
    u8 unk_00[0x1C];
    s32 unk_1C;
    s32 unk_20;
} Sprite;

typedef struct {
    s32 count;
    s32 items[0xB5];
} ScreenList;

typedef struct {
    u8 unk_00[0x3C];
    Sprite *unk_3C;
    u8 unk_40[0x20];
    s32 *unk_60;
    u8 unk_64[0x4];
    s32 unk_68;
    s32 unk_6C;
    u8 unk_70[0x4];
    ScreenList unk_74;
} Screen;

extern s32 D_80087AA8;
extern u8 D_8008A5D8;
extern s8 D_8008B2A8[];
extern IdList D_8008BB90;

Sprite *func_8000D740(s32, s32, SpriteDesc *);
s32 func_8000D8DC(s32, ImageDesc *);
void func_80016FE4(s32);
s32 *func_80032E00(s32, s32);
void func_800A7FD0(Screen *, u16, s8);
void func_800A80AC(Screen *, u16, s8);
void func_800D6424(Sprite *, s32, s32, s32);
void func_800DD634(void);
void func_800DD648(s8);

void func_800A7BB0(Screen *arg0) {
    SpriteDesc desc;
    ImageDesc image;
    IdList ids = D_8008BB90;
    Sprite *sprite;
    s32 *images;
    u16 i;
    s32 team;
    ScreenList *list;

    list = &arg0->unk_74;
    list->count = 0xB5;
    for (i = 0; i < 0xB4; i++) {
        list->items[i] = 0;
    }
    list->items[i] = 0;
    desc.unk_00 = 0x158;
    desc.unk_04 = &arg0->unk_74;
    desc.unk_08 = 0;
    desc.unk_10 = 7;
    sprite = func_8000D740(D_80087AA8, 1, &desc);
    arg0->unk_3C = sprite;
    images = func_80032E00(0, 0x20);
    arg0->unk_60 = images;
    func_800DD634();
    image.unk_0C = 0x10;
    image.unk_06 = 4;
    image.unk_08 = 0x64;
    image.unk_04 = 4;
    image.unk_10 = 0;
    for (i = 0; i < 8; i++) {
        image.unk_00 = ids.unk_00[i];
        images[i] = func_8000D8DC(0, &image);
        func_80016FE4(images[i]);
    }
    team = D_8008A5D8;
    arg0->unk_68 = team;
    func_800DD648(team);
    arg0->unk_6C = D_8008B2A8[team];
    func_800A7FD0(arg0, team, D_8008B2A8[team]);
    func_800A80AC(arg0, team, D_8008B2A8[team]);
    sprite->unk_1C = 0;
    sprite->unk_20 = 0x14A;
    func_800D6424(sprite, 0, 3, 0xA);
}
