#include "types.h"

typedef struct {
    s32 *first;
    s32 *second;
    u8 pad08[0x18];
} Dialog;

typedef struct {
    u8 pad00[0x14];
    s32 flags;
} Sprite;

typedef struct {
    u8 mode;
    u8 pad01[7];
    u16 pending;
    u8 pad0A[0x12];
    Sprite *cursor;
    Sprite *highlight;
    u8 pad24[4];
    s32 sound;
} Swap;

typedef struct {
    u8 pad00[0x60];
    Swap *swap;
} Owner;

extern s32 D_800C33BC;
extern s32 D_800C33D4;

void func_80092B98(void);
void func_800B1694(Owner *);
void func_800B17A0(Swap *);
void func_800B1BD0(Swap *, s32);
void func_800B1D04(Swap *);
void func_800D6454(Dialog *);
void func_800D67B8(Dialog *);
void func_800E08A4(s32);

void func_800B1A20(Owner *owner) {
    Swap *swap = owner->swap;
    Dialog dialog;

    switch (swap->mode) {
        case 0:
            swap->cursor->flags &= ~1;
            swap->highlight->flags |= 1;
            func_800E08A4(swap->sound);
            swap->mode = 1;
            func_800B1BD0(swap, 0);
            func_800B1694(owner);
            func_80092B98();
            break;
        case 1:
            if (swap->pending != 0) {
                func_800B1D04(swap);
                func_800B1694(owner);
                func_800B17A0(swap);
                swap->mode = 0;
            } else {
                func_800D67B8(&dialog);
                dialog.first = &D_800C33BC;
                dialog.second = &D_800C33D4;
                func_800D6454(&dialog);
                swap->mode = 0;
            }
            func_80092B98();
            break;
    }
}
