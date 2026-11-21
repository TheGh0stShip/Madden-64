#include "types.h"

typedef struct {
    /* 0x00 */ u8 pad_00[0x14];
    /* 0x14 */ s32 flags;
} Sub38;

typedef struct {
    /* 0x00 */ u8 pad_00[3];
    /* 0x03 */ u8 unk_03;
    /* 0x04 */ s32 unk_04;
    /* 0x08 */ s32 unk_08;
} Sub60;

typedef struct {
    /* 0x00 */ u8 pad_00[0x2D];
    /* 0x2D */ u8 unk_2D;
} SubC;

typedef struct {
    /* 0x00 */ u8 pad_00[0xC];
    /* 0x0C */ SubC *unk_0C;
} Sub24;

typedef struct {
    /* 0x00 */ u8 pad_00[0x1C];
    /* 0x1C */ s32 unk_1C;
    /* 0x20 */ s32 unk_20;
} Info;

typedef struct {
    /* 0x00 */ u8 pad_00[0x24];
    /* 0x24 */ Sub24 *unk_24;
    /* 0x28 */ u8 pad_28[0x38 - 0x28];
    /* 0x38 */ Sub38 *unk_38;
    /* 0x3C */ s32 unk_3C;
    /* 0x40 */ u8 pad_40[0x60 - 0x40];
    /* 0x60 */ Sub60 *unk_60;
} Screen;

void func_80016FF4(s32 handle);
u16 func_8003A1D0(void);
u8 func_80092BD0(u8 a, s32 b, s32 c);
u8 func_80092CFC(u8 a, s32 b, s32 c);
void func_800AF0DC(Screen *screen, u16 value, s32 mode);
void func_800AFB8C(Sub38 *obj, s32 value, Screen *screen);
void func_800B3F38(Screen *screen);
void func_800B3FA8(Screen *screen);
void func_800B411C(Screen *screen);
void func_800B45D0(Screen *screen);
void func_800B478C(Screen *screen, u8 value);
void func_800D63B4(Screen *screen);
void func_800D6424(s32 a, s32 b, s32 c, s32 d);
void func_800DB478(SubC *obj);
Info *func_800DD634(void);
void func_800DF6EC(void);
void func_800DF72C(void);

void func_800B3B44(Screen *screen, s32 arg1, s16 event) {
    Sub60 *sub;
    SubC *subc;
    Info *info;

    sub = screen->unk_60;
    subc = screen->unk_24->unk_0C;
    switch (event) {
    case 13:
        func_800AFB8C(screen->unk_38, 0, screen);
        screen->unk_38->flags |= 1;
        if (sub->unk_08 != 0) {
            func_800AF0DC(screen, func_8003A1D0(), 7);
        } else {
            func_800AF0DC(screen, 0, 7);
        }
        func_800B45D0(screen);
        if (!func_8003A1D0()) {
            info = func_800DD634();
            func_80016FF4(info->unk_1C);
            func_80016FF4(info->unk_20);
            subc->unk_2D = 0xFF;
        }
        break;
    case 19:
    case 20:
        func_800B411C(screen);
        func_800B45D0(screen);
        break;
    case 5:
        func_800DF6EC();
        func_800B478C(screen, func_80092CFC(sub->unk_03, 0x1E, 1));
        func_800DB478(subc);
        func_800B45D0(screen);
        break;
    case 4:
        func_800DF6EC();
        func_800B478C(screen, func_80092BD0(sub->unk_03, 0x1E, 1));
        func_800DB478(subc);
        func_800B45D0(screen);
        break;
    case 8:
        if (func_8003A1D0()) {
            func_800DF72C();
            func_800B3F38(screen);
        }
        break;
    case 17:
    case 28:
        func_800DF72C();
        func_800B3FA8(screen);
        break;
    case 12:
        func_800D63B4(screen);
        func_800D6424(screen->unk_3C, 0x14A, 0, 0xA);
        break;
    }
}
