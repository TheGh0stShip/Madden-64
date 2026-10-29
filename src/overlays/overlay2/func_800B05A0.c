#include "types.h"

typedef struct {
    u8 pad00[0x14];
    s32 flags;
} Sprite;

typedef struct {
    u8 pad00[0xC];
    s32 handle;
} Track;

typedef struct {
    u8 pad00[0x24];
    Track *track;
    u8 pad28[0x10];
    Sprite *button;
} Screen;

void func_800B0D9C(Sprite *, s32, Screen *);
void func_800DF72C(void);
void func_800DB44C(s32, s32 *, s32 *, s32 *);
void func_800B07F8(Screen *, u16);
void func_800DD4B8(void);
void func_800D63B4(Screen *);

void func_800B05A0(Screen *screen, s32 unused, s16 event) {
    s32 handle = screen->track->handle;
    s32 kind;
    s32 row;
    s32 col;

    switch (event) {
        case 13:
            func_800B0D9C(screen->button, 0, screen);
            screen->button->flags |= 1;
            break;
        case 8:
            func_800DF72C();
            func_800DB44C(handle, &kind, &row, &col);
            func_800B07F8(screen, row);
            break;
        case 28:
            func_800DF72C();
            func_800DD4B8();
            break;
        case 12:
            func_800D63B4(screen);
            break;
    }
}
