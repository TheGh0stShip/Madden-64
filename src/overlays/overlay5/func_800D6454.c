#include "types.h"

typedef struct {
    s32 *lines[3];
    s32 *opts[3];
    s32 flags;
} Dialog;

typedef struct {
    s16 unk0;
    s32 *unk4;
    s32 unk8;
    u8 padC[4];
    s16 unk10;
} SpriteDesc;

typedef struct {
    u8 pad00[0x14];
    s32 flags;
    u8 pad18[8];
    s32 unk20;
} Sprite;

typedef struct {
    s32 x;
    s32 y;
    s32 w;
    s32 h;
} Rect;

extern s32 D_80087AA8;

void func_8000BE80(void);
void func_8000BF08(void);
Sprite *func_8000D740(s32, s32, SpriteDesc *);
void func_8000D998(s32, Sprite *);
void func_80011AF4(void);
void func_80011B3C(void);
void func_8001F070(Sprite *, s32, Rect *);
void func_80030050(void);
void func_80030110(void);
void func_80030A28(void);
u32 func_80030DF0(void);
void func_8003E460(void);
u32 func_8004DF94(s32 *);
void overlay5_resource_mode_notify(void);
void func_800DF72C(void);

s16 func_800D6454(Dialog *dialog) {
    SpriteDesc desc;
    s32 msg[8];
    Rect pos;
    u16 i;
    u16 nopts;
    u16 nlong;
    u32 buttons;
    Sprite *box;
    Sprite *cursor;
    u16 sel;

    nopts = 0;
    nlong = 0;
    buttons = 0;
    cursor = 0;
    sel = 0;
    for (i = 0; i < 3; i++) {
        msg[1 + i] = (s32)dialog->lines[i];
        msg[4 + i] = (s32)dialog->opts[i];
        nopts += dialog->opts[i] != 0 ? 1 : 0;
    }
    if (dialog->lines[0] != 0 && func_8004DF94(dialog->lines[0]) >= 30) {
        nlong++;
    }
    if (dialog->lines[1] != 0 && func_8004DF94(dialog->lines[1]) >= 30) {
        nlong++;
    }
    if (dialog->lines[2] != 0 && func_8004DF94(dialog->lines[2]) >= 30) {
        nlong++;
    }
    if (nopts != 0) {
        msg[0] = 6;
        desc.unk0 = nlong != 0 ? 0x300 : 0x2E0;
    } else {
        msg[0] = 3;
        desc.unk0 = nlong != 0 ? 0x310 : 0x2F0;
    }
    desc.unk4 = msg;
    desc.unk8 = 0;
    desc.unk10 = 2;
    box = func_8000D740(D_80087AA8, 1, &desc);
    if (nopts != 0) {
        desc.unk0 = nlong != 0 ? 0x308 : 0x2E8;
        desc.unk10 = 2;
        cursor = func_8000D740(D_80087AA8, 1, &desc);
        sel = dialog->flags & 3;
        cursor->flags &= ~1;
    }
    func_8003E460();
    while (!(buttons & 0xD000)) {
        func_80030A28();
        func_80030110();
        func_80030050();
        func_8000BF08();
        buttons = func_80030DF0();
        if (nopts != 0) {
            if (buttons & 0x800) {
                if (sel != 0) {
                    sel--;
                    if (!(dialog->flags & 4)) {
                        overlay5_resource_mode_notify();
                    }
                }
            }
            if (buttons & 0x400) {
                if (sel < nopts - 1) {
                    sel++;
                    if (!(dialog->flags & 4)) {
                        overlay5_resource_mode_notify();
                    }
                }
            }
            pos.y = cursor->unk20 + 0x10;
            func_8001F070(box, sel + 4, &pos);
            cursor->unk20 = pos.y - 0x10;
            cursor->flags |= 1;
        }
    }
    func_80011AF4();
    if (!(dialog->flags & 4)) {
        func_800DF72C();
    }
    func_8000BE80();
    func_8000D998(D_80087AA8, box);
    if (nopts != 0) {
        func_8000D998(D_80087AA8, cursor);
    }
    if (buttons & 0x9000) {
        func_80011B3C();
        return sel;
    }
    if (!(dialog->flags & 8)) {
        return -1;
    }
    return sel;
}
